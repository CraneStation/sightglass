#!/usr/bin/env bash

# Run a single native benchmark that is already built
#
# Usage: ./run-native.sh <path-to-benchmark-folder/target/benchmark.so>

set -e

BENCHMARKS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SIGHTGLASS_BASE=$(dirname $BENCHMARKS_DIR)

SIGHTGLASS="cargo run --release --bin sightglass-cli --"

ENGINE=$SIGHTGLASS_BASE/engines/native/libengine.so

BENCHMARK_NATIVE_SO="";

for ARG in "$@"; do
    if [[ -f $ARG ]]; then
        BENCHMARK_NATIVE_SO=$ARG;
        break
    fi
done

if [[ -z $BENCHMARK_NATIVE_SO ]]; then
    echo "Missing benchmark"
    echo "Usage: run-native.sh <path-to-benchmark-folder/target/benchmark.so>"
    exit
fi

BENCHMARK_NATIVE_SO="$(realpath $BENCHMARK_NATIVE_SO)"

print_header() {
    >&2 echo
    >&2 echo ===== $@ =====
}

# If an engine is not available, build it.
if [[ ! -f $ENGINE ]]; then
    cd $SIGHTGLASS_BASE/engines/native/libengine/
    cargo build --release
    cp target/release/libnative_bench_api.so ../libengine.so
    cd - > /dev/null
fi

# Run a benchmark with the newly created library
cd $SIGHTGLASS_BASE
BENCH_DIR=$(dirname $BENCHMARK_NATIVE_SO)
echo $BENCH_DIR
LD_LIBRARY_PATH=./engines/native/ $SIGHTGLASS benchmark --engine engines/native/libengine.so --working-dir $BENCH_DIR -- $BENCHMARK_NATIVE_SO
cd - > /dev/null

