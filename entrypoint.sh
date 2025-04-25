#!/bin/bash

# setup environment
python3 -m venv /app/ComfyUI/venv
. /app/ComfyUI/venv/bin/activate

# Install main dependencies
pip install -r /app/ComfyUI/requirements.txt

# Install Python dependencies for custom nodes
find /app/ComfyUI/custom_nodes -type f -name requirements.txt -exec pip install -r {} \;

# Execute the CMD command
exec "$@"