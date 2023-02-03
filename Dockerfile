FROM ubuntu:latest

COPY . .


# install pip to get optimum-cli package
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.5 \
    python3-pip \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install -r requirements.txt

# install rust
RUN apt-get update && apt-get install -y curl
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN apt-get install build-essential -y


# data seems to be clogging up even when containers are removed
# run: docker system prune --all --force
# to remove all data

