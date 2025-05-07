# syntax=docker/dockerfile:1

FROM semaphoreui/semaphore:latest

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN source $HOME/.cargo/env
ENV PATH="/home/semaphore/.cargo/bin:${PATH}"

USER root
RUN apk add --no-cache build-base
USER 1001

# Possible workaround for https://github.com/bitwarden/sdk-sm/issues/1148
RUN wget 'https://files.pythonhosted.org/packages/dd/03/11934ae9d668283895286872a7af3de25d324ec9ac86da5a56ac9dc48544/bitwarden_sdk-1.0.0.tar.gz' && tar xf bitwarden_sdk-1.0.0.tar.gz && cd bitwarden_sdk-1.0.0 && wget 'https://raw.githubusercontent.com/bitwarden/sdk/refs/heads/main/LICENSE' && pip3 install .
