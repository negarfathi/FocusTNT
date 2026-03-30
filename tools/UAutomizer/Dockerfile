FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    openjdk-11-jdk \
    python3 \
    z3 \
 && apt clean

COPY UAutomizer-linux /opt/uautomizer

WORKDIR /opt/uautomizer