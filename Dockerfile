FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Set-up multiple python versions for testing
# with tox
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        python3.7 \
        python3.8 \
        python3-pip && \
    python3 -m pip install virtualenv  && \
    apt-get clean

CMD tail -f /dev/null
