#!/bin/bash

# This will download a copy of OpenVINO and extract it locally, as well as the needed model files and test image. Once this script is run, you can use this command to run the benchmark:
# cargo run -- benchmark benchmarks/image-classification/image-classification-benchmark.wasm --engine-flags="--wasi nn" --engine engines/wasmtime/libengine.so

WASI_NN_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
FILENAME=l_openvino_toolkit_ubuntu20_2022.2.0.7713.af16ea1d79a_x86_64
MODEL=https://github.com/intel/openvino-rs/raw/main/crates/openvino/tests/fixtures/mobilenet
[ ! -d ${WASI_NN_DIR}/mobilenet.xml ] && wget -nc ${MODEL}/mobilenet.xml -O ${WASI_NN_DIR}/mobilenet.xml
[ ! -d ${WASI_NN_DIR}/mobilenet.bin ] && wget -nc -q --no-check-certificate ${MODEL}/mobilenet.bin -O ${WASI_NN_DIR}/mobilenet.bin
[ ! -d ${WASI_NN_DIR}/openvino ] && wget -nc -q --no-check-certificate https://storage.openvinotoolkit.org/repositories/openvino/packages/2022.2/linux/${FILENAME}.tgz -O ${WASI_NN_DIR}/${FILENAME}.tgz
[ ! -d ${WASI_NN_DIR}/openvino ] && wget -nc -q --no-check-certificate https://storage.openvinotoolkit.org/repositories/openvino/packages/2022.2/linux/${FILENAME}.tgz -O ${WASI_NN_DIR}/${FILENAME}.tgz
[ ! -d ${WASI_NN_DIR}/openvino ] && tar -C ${WASI_NN_DIR} -zxf ${WASI_NN_DIR}/${FILENAME}.tgz  && mv ${WASI_NN_DIR}/${FILENAME} ${WASI_NN_DIR}/openvino || echo "OpenVINO is already there, skipping..."
. ${WASI_NN_DIR}/openvino/setupvars.sh