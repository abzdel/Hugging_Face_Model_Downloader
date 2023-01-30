#!/usr/bin/bash

# take a link to a repository as user input
echo "please enter your link to a model from Hugging Face"
read line
echo "your link is: $line"

# create txt file where path to model will live
touch model.txt
echo "$line" > model.txt

# call python script to download model
#python3 download_model.py # need to implement this

# call script to send model to cloud service (TBD)
# need to implement

# pull onnx model back from cloud service (TBD)
# need to implement

# exit w/ success status
exit 1


