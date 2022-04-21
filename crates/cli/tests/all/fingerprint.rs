//! Test `sightglass-cli fingerprint`.

use super::util::{benchmark, sightglass_cli};
use assert_cmd::prelude::*;
use predicates::prelude::*;
use sightglass_fingerprint::{Benchmark, Machine};

use crate::util::test_engine;

#[test]
fn fingerprint_machine() {
    let assert = sightglass_cli()
        .arg("fingerprint")
        .arg("--kind")
        .arg("machine")
        .assert();

    let stdout = std::str::from_utf8(&assert.get_output().stdout).unwrap();
    eprintln!("=== stdout ===\n{}\n===========", stdout);
    assert!(serde_json::from_str::<Machine>(stdout).is_ok());
}

#[test]
fn fingerprint_benchmark() {
    let assert = sightglass_cli()
        .arg("fingerprint")
        .arg("--kind")
        .arg("benchmark")
        .arg("--output-format")
        .arg("csv")
        .arg(benchmark("noop"))
        .assert();

    let stdout = std::str::from_utf8(&assert.get_output().stdout).unwrap();
    eprintln!("=== stdout ===\n{}\n===========", stdout);
    let mut reader = csv::Reader::from_reader(stdout.as_bytes());
    for measurement in reader.deserialize::<Benchmark>() {
        drop(measurement.unwrap());
    }

    assert
        .stdout(
            predicate::str::starts_with("name,path,hash,size\n")
                .and(predicate::str::contains("noop/benchmark.wasm")),
        )
        .success();
}

#[test]
fn fingerprint_engine() {
    let engine_path = test_engine();
    let assert = sightglass_cli()
        .arg("fingerprint")
        .arg("--kind")
        .arg("engine")
        .arg("--output-format")
        .arg("json")
        .arg(&engine_path)
        .assert();

    let stdout = std::str::from_utf8(&assert.get_output().stdout).unwrap();
    eprintln!("=== stdout ===\n{}\n===========", stdout);
    let mut reader = csv::Reader::from_reader(stdout.as_bytes());
    for measurement in reader.deserialize::<Benchmark>() {
        drop(measurement.unwrap());
    }

    use predicate::str::*;
    assert
        .stdout(
            starts_with("{")
                .and(contains(r#""name":"wasmtime""#))
                .and(contains(format!(r#""path":"{}""#, engine_path.display())))
                .and(contains(
                    r#""rebuild":"sightglass-cli build-engine wasmtime?REVISION="#,
                ))
                .and(ends_with("}")),
        )
        .success();
}
