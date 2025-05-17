#!/bin/bash

# setup environment
python3 -m venv /app/ComfyUI/venv
. /app/ComfyUI/venv/bin/activate


# Only run setup if the CMD is python-related

if [[ "$1" == "python"* ]]; then
    # Update pytorch and xformers (CUDA 12.6)
    pip install torch==2.7.0 xformers==0.0.30 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu126

    # Install main dependencies
    pip install -r /app/ComfyUI/requirements.txt

    # Install Python dependencies from 1st-level custom_nodes/* directories only
    for dir in /app/ComfyUI/custom_nodes/*; do
        if [[ -d "$dir" && -f "$dir/requirements.txt" ]]; then
            echo "Installing requirements in $dir/requirements.txt"
            pip install -r "$dir/requirements.txt"
        fi
    done
else
    echo "Skipping dependency installation since CMD is not python-related."
fi

# Execute the CMD command
exec "$@"
