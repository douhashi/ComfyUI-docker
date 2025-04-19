# Use the specified base image
FROM nvidia/cuda:12.1.0-base-ubuntu22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

COPY ./ComfyUI/requirements.txt /app/ComfyUI/requirements.txt

# Install Python dependencies
RUN pip3 install --no-cache-dir -r ComfyUI/requirements.txt

# Copy ComfyUI source code
COPY ./ComfyUI /app/ComfyUI
COPY ./ComfyUI-Manager /app/ComfyUI/custom_nodes/ComfyUI-Manager

# Expose the port used by the application
EXPOSE 8188

# Set the entrypoint to run the application
CMD ["python3", "ComfyUI/main.py", "--listen"]