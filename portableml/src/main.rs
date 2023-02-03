// create function to pull regex out of string
// regex should be all characters after huggingface.co/

use regex::Regex;
use std::process::Command;

pub fn get_model_from_link(url: &str) -> String {
    let re = Regex::new(r"huggingface.co/(.*+)").unwrap();
    let caps = re.captures(url).unwrap();
    let model_name = caps.get(1).unwrap().as_str();
    model_name.to_string()
}


pub fn main() {

    // read url from model.txt
    let url = std::fs::read_to_string("../model.txt").unwrap();

    // call get_model_name function
    let model_name = String::from(get_model_from_link(&url));

    let mut cmd = Command::new("optimum-cli");
    cmd.arg("export")
        .arg("onnx")
        .arg("--model")
        .arg(model_name)
        .arg("../model/");


    
    match cmd.output() {
        Ok(output) => {
            println!("Model downloaded to ../model/: {}", output.status);
        }
        Err(e) => {
            println!("Error: {}", e);
        }
    }
}