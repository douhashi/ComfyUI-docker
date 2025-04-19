# ComfyUI-docker

## Overview
ComfyUI-docker is a project designed to simplify the setup and execution of [ComfyUI](https://github.com/Comfy-Org/ComfyUI) and its extension, [ComfyUI-Manager](https://github.com/Comfy-Org/ComfyUI-Manager), within a Docker environment.

## Features
- Easy setup using Docker.
- High-performance processing with GPU support (NVIDIA GPUs).
- Integrated environment for ComfyUI and ComfyUI-Manager.

## Setup Instructions

### Prerequisites
- Docker and Docker Compose must be installed.
- For NVIDIA GPU support, NVIDIA Container Toolkit must be installed.

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/ComfyUI-docker.git
   cd ComfyUI-docker
   ```

2. Initialize and update submodules if necessary:
   ```bash
   git submodule update --init --recursive
   ```

3. Build the Docker image:
   ```bash
   docker-compose build
   ```

4. Start the container:
   ```bash
   docker-compose up -d
   ```

5. Access ComfyUI in your browser at:
   ```
   http://localhost:8188
   ```

## Directory Structure
```
ComfyUI-docker/
├── docker-compose.yml  # Docker Compose configuration file
├── Dockerfile          # Docker image build configuration
├── ComfyUI/            # ComfyUI core
├── ComfyUI-Manager/    # ComfyUI extension
└── README.md           # This file
```

## Environment Variables
- `NVIDIA_VISIBLE_DEVICES`: Specifies the GPU devices to use.
- `NVIDIA_DRIVER_CAPABILITIES`: Specifies GPU capabilities (e.g., `compute,utility`).

## Notes
- Ensure NVIDIA Container Toolkit is properly configured if using GPU support.
- Edit `docker-compose.yml` as needed to customize your environment.

## License
This project is licensed under the [MIT License](LICENSE).