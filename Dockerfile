# syntax=docker/dockerfile:1

FROM semaphoreui/semaphore:latest

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN source $HOME/.cargo/env