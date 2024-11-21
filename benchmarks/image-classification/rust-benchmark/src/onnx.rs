use image::io::Reader;
use image::DynamicImage;
use sightglass_api as bench;
use std::convert::TryInto;
use std::fs;
use wasi_nn;
mod imagenet_classes;

pub fn main() {
    // Convert image to tensor data.
    let tensor_data = fs::read("./kitten.rgb").unwrap();

    // Load model from a file.
    let graph =
        wasi_nn::GraphBuilder::new(wasi_nn::GraphEncoding::Onnx, wasi_nn::ExecutionTarget::CPU)
            .build_from_files(["./mobilenet.onnx"])
            .unwrap();

    let mut context = graph.init_execution_context().unwrap();
    context
    .set_input(0, wasi_nn::TensorType::F32, &[1, 3, 224, 224], &tensor_data)
    .unwrap();

    bench::start();

    // Execute the inference.
    context.compute().unwrap();

    bench::end();


    // Retrieve the output.
    let mut output_buffer = vec![0f32; 1000];
    context.get_output(0, &mut output_buffer[..]).unwrap();

    let result = sort_results(&output_buffer);
}

// Sort the buffer of probabilities. The graph places the match probability for each class at the
// index for that class (e.g. the probability of class 42 is placed at buffer[42]). Here we convert
// to a wrapping InferenceResult and sort the results.
fn sort_results(buffer: &[f32]) -> Vec<InferenceResult> {
    let mut results: Vec<InferenceResult> = buffer
        .iter()
        .skip(1)
        .enumerate()
        .map(|(c, p)| InferenceResult(c, *p))
        .collect();
    results.sort_by(|a, b| b.1.partial_cmp(&a.1).unwrap());
    results
}

// A wrapper for class ID and match probabilities.
#[derive(Debug, PartialEq)]
struct InferenceResult(usize, f32);
