# Image Classification

This benchmark uses [wasi-nn](https://github.com/WebAssembly/wasi-nn), a proposed [WebAssembly System Interface](https://github.com/WebAssembly/WASI) API for machine
learning (ML). It uses the OpenVINO backend to identify the subject of the test image, and measures the time required for a single inference to run.

## Steps to run this benchmark from the top sightglass directory
- `source ./benchmarks/image-classification/setup.sh`
- `cargo run -- benchmark --engine engines/wasmtime/libengine.so --engine-flags=--wasi nn -- benchmarks/image-classification/image-classification-benchmark.wasm`
## Notes:
- You must install and setup OpenVINO to run this benchmark. You can install OpenVINO and the other required files by sourcing `setup.sh` which also sets up the OpenVINO enviromnent variables. Do this each time you start a new terminal.
- You must use `--engine-flags=--wasi-modules=--wasi nn` when running this benchmark. Otherwise Wasmtime won't link the required wasi-nn functions.