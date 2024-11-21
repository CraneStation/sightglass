//! A mechanism to measure performance using CPU counters through `perf_event_open`. For this to
//! work (and it will only work on Linux systems currently), you may need to tweak
//! `/proc/sys/kernel/perf_event_paranoid` by running a command such as: `sudo sysctl -w
//! kernel.perf_event_paranoid=0`.
use super::Measure;
use crate::measure::Measurements;
use perf_event::{
    events::{Hardware, Software},
    Builder, Counter, Group,
};
use serde::{Deserialize, Serialize};
use sightglass_data::Phase;

/// Measure CPU counters.
pub struct CounterMeasure {
    event_group: Group,
    cpu_cycles: Counter,
    instructions_retired: Counter,
    cache_accesses: Counter,
    cache_misses: Counter,
    task_clock: Counter,
}

impl CounterMeasure {
    pub fn new() -> Self {
        let mut group = Group::new().expect(
            "Unable to create event group; try setting /proc/sys/kernel/perf_event_paranoid to 2 \
            or below?",
        );
        Self {
            cpu_cycles: Builder::new()
                .group(&mut group)
                .kind(Hardware::CPU_CYCLES)
                .build()
                .expect(
                    "Unable to create CPU_CYCLES hardware counter. Does this system actually \
                     have such a counter? If it does, your kernel may not fully support this \
                     processor.",
                ),
            instructions_retired: Builder::new()
                .group(&mut group)
                .kind(Hardware::INSTRUCTIONS)
                .build()
                .expect(
                    "Unable to create INSTRUCTIONS hardware counter. Does this system actually \
                    have such a counter? If it does, your kernel may not fully support this \
                    processor.",
                ),
            cache_accesses: Builder::new()
                .group(&mut group)
                .kind(Hardware::CACHE_REFERENCES)
                .build()
                .expect(
                    "Unable to create CACHE_REFERENCES hardware counter. Does this system actually \
                     have such a counter? If it does, your kernel may not fully support this \
                     processor.",
                ),
            cache_misses: Builder::new()
                .group(&mut group)
                .kind(Hardware::CACHE_MISSES)
                .build()
                .expect(
                    "Unable to create CACHE_MISSES hardware counter. Does this system actually \
                     have such a counter? If it does, your kernel may not fully support this \
                     processor.",
                ),
            task_clock: Builder::new()
                .group(&mut group)
                .kind(Software::TASK_CLOCK)
                .build()
                .expect(
                    "Unable to create TASK_CLOCK software counter. Does this system actually \
                     have such a counter? If it does, your kernel may not fully support this \
                     processor.",
                ),
            event_group: group,
        }
    }
}

impl Measure for CounterMeasure {
    fn start(&mut self, _phase: Phase) {
        self.event_group.reset().unwrap();
        self.event_group.enable().unwrap()
    }

    fn end(&mut self, phase: Phase, measurements: &mut Measurements) {
        self.event_group.disable().unwrap();
        let counts = self.event_group.read().unwrap();
        measurements.reserve(4);
        measurements.add(phase, "cpu-cycles".into(), counts[&self.cpu_cycles]);
        measurements.add(
            phase,
            "instructions-retired".into(),
            counts[&self.instructions_retired],
        );
        measurements.add(phase, "cache-accesses".into(), counts[&self.cache_accesses]);
        measurements.add(phase, "cache-misses".into(), counts[&self.cache_misses]);
        measurements.add(phase, "task-clocks".into(), counts[&self.task_clock]);
    }
}

/// A recording of time and performance counter information. `PerfCounters::default()` provides a
/// useful zero to accumulate into.
#[derive(Clone, Copy, Debug, Default, Serialize, Deserialize)]
pub struct PerfCounters {
    /// Measured by performance counter. May be 0, in which case the counter is almost certainly
    /// disabled.
    pub cpu_cycles: u64,
    /// Measured by performance counter. May be 0, in which case the counter is almost certainly
    /// disabled.
    pub instructions_retired: u64,
    /// Measured by performance counter. May be 0, in which case the counter is almost certainly
    /// disabled.
    pub cache_accesses: u64,
    /// Measured by performance counter. May be 0, in which case the counter is almost certainly
    /// disabled.
    pub cache_misses: u64,
    /// Measured by performance counter. May be 0, in which case the counter is almost certainly
    /// disabled.
    pub task_clock: u64,
}

impl std::ops::Div<u64> for PerfCounters {
    type Output = Self;
    fn div(self, rhs: u64) -> Self::Output {
        PerfCounters {
            cpu_cycles: self.cpu_cycles / rhs,
            instructions_retired: self.instructions_retired / rhs,
            cache_accesses: self.cache_accesses / rhs,
            cache_misses: self.cache_misses / rhs,
            task_clock: self.task_clock / rhs,
        }
    }
}

impl std::ops::Add<PerfCounters> for PerfCounters {
    type Output = Self;
    fn add(self, rhs: PerfCounters) -> Self::Output {
        PerfCounters {
            cpu_cycles: self.cpu_cycles + rhs.cpu_cycles,
            instructions_retired: self.instructions_retired + rhs.instructions_retired,
            cache_accesses: self.cache_accesses + rhs.cache_accesses,
            cache_misses: self.cache_misses + rhs.cache_misses,
            task_clock: self.task_clock + rhs.task_clock,
        }
    }
}

impl std::ops::AddAssign<PerfCounters> for PerfCounters {
    fn add_assign(&mut self, rhs: PerfCounters) {
        self.cpu_cycles += rhs.cpu_cycles;
        self.instructions_retired += rhs.instructions_retired;
        self.cache_accesses += rhs.cache_accesses;
        self.cache_misses += rhs.cache_misses;
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::env;

    #[test]
    fn sanity() {
        if env::var("CI").is_ok() {
            // If we find ourselves in a CI environment, skip this test: not all CI environments
            // have perf events available (e.g. https://github.community/t/149164). Since this
            // short-circuiting could be problematic in the future, we attempt to warn the user
            // (hoping they have `--nocapture` set).
            println!(
                "Skipping the perf counters sanity test; it seems that this test is running \
                in a CI environment"
            );
            return;
        }

        let mut measurements = Measurements::new("arch".into(), "engine".into(), "wasm".into());
        let mut measure = CounterMeasure::new();
        measure.start(Phase::Compilation);
        let mut a = 0;
        for i in 0..1_000_000 {
            a = i
        }
        measure.end(Phase::Compilation, &mut measurements);
        let measurements = measurements.finish();
        println!("Result: {}", a);
        println!("Measurements: {:?}", measurements);
    }
}
