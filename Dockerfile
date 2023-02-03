FROM ubuntu:latest

COPY . .

# install rust
RUN apt-get update && apt-get install -y curl
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN apt-get install build-essential -y

