#!/bin/bash

# setup environment
python3 -m venv /app/ComfyUI/venv
. /app/ComfyUI/venv/bin/activate

# Update pytorch and xformers (CUDA 12.6)
pip install torch==2.7.0 xformers==0.0.30 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu126

# Install main dependencies
pip install -r /app/ComfyUI/requirements.txt

# Install Python dependencies for custom nodes
find /app/ComfyUI/custom_nodes -type f -name requirements.txt -exec pip install -r {} \;

# Execute the CMD command
exec "$@"
