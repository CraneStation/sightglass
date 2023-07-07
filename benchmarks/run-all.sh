#!/usr/bin/env bash

# Run all of the benchmarks found in the `benchmarks` directory.
#
# Usage: ./run-all.sh

set -e
# From https://stackoverflow.com/a/246128:
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
SUITE=$SCRIPT_DIR/all.suite
PROJECT_DIR=$(dirname $SCRIPT_DIR)
SIGHTGLASS="cargo run --bin sightglass-cli --"
ENGINE=$PROJECT_DIR/engines/wasmtime/libengine.so
export RUST_LOG=debug

# If an engine is not available, build it.
if [[ ! -f $ENGINE ]]; then
    pushd $PROJECT_DIR/engines/wasmtime
    rustc build.rs
    ./build
    popd
fi

# Benchmark each Wasm file.
$SIGHTGLASS benchmark --engine $ENGINE \
    --processes 1 --iterations-per-process 3 \
    $SUITE
