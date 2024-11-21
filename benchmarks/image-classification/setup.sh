#!/bin/bash

# This will download a copy of OpenVINO and extract it locally, as well as the needed model files and test image. Once this script is run, you can use this command to run the benchmark:
# cargo run -- benchmark benchmarks/image-classification/image-classification-benchmark.wasm --engine-flags="--wasi nn" --engine engines/wasmtime/libengine.so

WASI_NN_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

OpenVINO
OPENVINO_FILENAME=l_openvino_toolkit_ubuntu20_2022.2.0.7713.af16ea1d79a_x86_64
OPENVINO_MODEL=https://github.com/intel/openvino-rs/raw/main/crates/openvino/tests/fixtures/mobilenet
[ ! -d ${WASI_NN_DIR}/mobilenet.xml ] && wget -nc ${OPENVINO_MODEL}/mobilenet.xml -O ${WASI_NN_DIR}/mobilenet.xml
[ ! -d ${WASI_NN_DIR}/mobilenet.bin ] && wget -nc -q --no-check-certificate ${OPENVINO_MODEL}/mobilenet.bin -O ${WASI_NN_DIR}/mobilenet.bin
[ ! -d ${WASI_NN_DIR}/openvino ] && wget -nc -q --no-check-certificate https://storage.openvinotoolkit.org/repositories/openvino/packages/2022.2/linux/${OPENVINO_FILENAME}.tgz -O ${WASI_NN_DIR}/${OPENVINO_FILENAME}.tgz
[ ! -d ${WASI_NN_DIR}/openvino ] && wget -nc -q --no-check-certificate https://storage.openvinotoolkit.org/repositories/openvino/packages/2022.2/linux/${OPENVINO_FILENAME}.tgz -O ${WASI_NN_DIR}/${OPENVINO_FILENAME}.tgz
[ ! -d ${WASI_NN_DIR}/openvino ] && tar -C ${WASI_NN_DIR} -zxf ${WASI_NN_DIR}/${OPENVINO_FILENAME}.tgz  && mv ${WASI_NN_DIR}/${OPENVINO_FILENAME} ${WASI_NN_DIR}/openvino || echo "OpenVINO is already there, skipping..."

# ONNX
ONNX_MODEL=https://github.com/onnx/models/raw/bec48b6a70e5e9042c0badbaafefe4454e072d08/validated/vision/classification/mobilenet/model/mobilenetv2-7.onnx?download=
[ ! -d ${WASI_NN_DIR}/mobilenet.onnx ] && wget -nc ${ONNX_MODEL} -O ${WASI_NN_DIR}/mobilenet.onnx
ONNX_IMAGE_RGB=https://github.com/bytecodealliance/wasmtime/raw/v20.0.2/crates/wasi-nn/tests/fixtures/kitten.rgb
[ ! -d ${WASI_NN_DIR}/kitten.rgb ] && wget -nc ${ONNX_IMAGE_RGB} -O ${WASI_NN_DIR}/kitten.rgb
