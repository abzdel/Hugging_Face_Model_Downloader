// create function to pull regex out of string
// regex should be all characters after huggingface.co/

use regex::Regex;

pub fn getModelFromLink(url: &str) -> String {
    let re = Regex::new(r"huggingface.co/(.*+)").unwrap();
    let caps = re.captures(url).unwrap();
    let model_name = caps.get(1).unwrap().as_str();
    model_name.to_string()
}


pub fn main() {

    // read url from model.txt
    let url = std::fs::read_to_string("../model.txt").unwrap();

    // call get_model_name function
    let model_name = getModelFromLink(&url);
    // println!("model_name: {}", model_name);

    // add newline to model_name
    let model_name = model_name + "\n";

    // export model_name to replace model.txt in previous folder
    std::fs::write("../model.txt", model_name).unwrap();
}