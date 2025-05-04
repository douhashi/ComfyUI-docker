#!/bin/bash

# setup environment
python3 -m venv /app/ComfyUI/venv
. /app/ComfyUI/venv/bin/activate

# Install pytorch and xformers (CUDA 12.1)
pip install torch==2.5.1 torchvision==0.20.1 torchaudio==2.5.1 --index-url https://download.pytorch.org/whl/cu121
pip install xformers==0.0.22 --index-url https://download.pytorch.org/whl/cu121

# Install main dependencies
pip install -r /app/ComfyUI/requirements.txt

# Install Python dependencies for custom nodes
find /app/ComfyUI/custom_nodes -type f -name requirements.txt -exec pip install -r {} \;

# Execute the CMD command
exec "$@"
