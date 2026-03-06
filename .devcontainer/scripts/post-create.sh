#!/usr/bin/env bash
# Configure Rust and Python tooling for this workspace after container creation.

set -euo pipefail

RUST_TARGETS=(
    "thumbv7em-none-eabihf"
    "aarch64-unknown-linux-gnu"
    "wasm32-unknown-unknown"
    "x86_64-unknown-linux-gnu"
)

echo "==> Configuring Rust toolchain"
rustup update stable
rustup default stable
rustup component add rustfmt clippy

for target in "${RUST_TARGETS[@]}"; do
    echo "==> Installing Rust target: ${target}"
    rustup target add "${target}"
done

echo "==> Installing Python packaging tools"
python3 -m venv venv
./venv/bin/python3 -m pip install --upgrade pip
./venv/bin/python3 -m pip install h5py maturin

echo "==> Toolchain versions"
rustc --version
cargo --version
cargo fmt --version
cargo clippy --version
./venv/bin/python3 --version

echo "==> Verifying workspace metadata"
cargo metadata --no-deps >/dev/null

echo "Codespace setup complete."
