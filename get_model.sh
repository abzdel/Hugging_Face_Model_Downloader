#!/usr/bin/bash

# take a link to a repository as user input
#echo "please enter your link to a model from Hugging Face"
#read line

# take a link to a repository as a command line argument
line=$1

# if no argument was entered, print error
[ -z "$line" ] && echo "please enter your link to a model from Hugging Face" && exit 1

# if argument is not link to a model, print error
[[ $line != *"huggingface"* ]] && echo "please enter a link to a model from Hugging Face" && exit 1

echo "your link is: $1"

# create txt file where path to model will live
touch model.txt
echo "$line" > model.txt

# run rust project to truncate link to model name
cd portableml
cargo run
cd ..

# create environment variable that holds contents of model.txt
export MODEL=$(cat model.txt)

# save model to local directory as ONNX file
# idea would be to put this line in a cloud environment?
optimum-cli export onnx --model $MODEL model/

# exit w/ success status
exit 1


