# Use the specified base image
FROM nvidia/cuda:12.1.0-base-ubuntu22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    libopencv-dev \
    git \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy ComfyUI source code
COPY ./ComfyUI /app/ComfyUI
COPY ./ComfyUI-Manager /app/ComfyUI/custom_nodes/ComfyUI-Manager

# Copy the entrypoint script
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Expose the port used by the application
EXPOSE 8188

# Set the entrypoint to the script
ENTRYPOINT ["/app/entrypoint.sh"]

# Set the command to run the application
CMD ["python3", "ComfyUI/main.py", "--listen"]