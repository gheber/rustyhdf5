# syntax=docker/dockerfile:1.4
FROM mcr.microsoft.com/devcontainers/rust:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        pkg-config \
        ca-certificates \
        curl \
        git \
        bash \
        python3 \
        python3-dev \
        python3-pip \
        python3-venv \
        python3-numpy \
        python3-h5py \
        python3-pytest \
        python3-maturin \
        libssl-dev \
        clang \
        lld \
        cmake \
    && rm -rf /var/lib/apt/lists/*

ENV PATH="/home/vscode/.local/bin:${PATH}"
