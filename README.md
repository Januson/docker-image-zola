# docker-zola

Provides a Docker image [Zola](https://www.getzola.org/), the Rust-based
static site generator. This image is using Zola version **0.15.3**, but it 
will be updated with later releases.

## Installation
```bash
docker pull januson/zola
```

## Usage
```bash
# Simple call
docker run --rm januson/zola --version

# Building the current directory
docker run --rm -v $(pwd):/workdir januson/zola build
```

### Git Bash
If you are using git-bash on windows you have to add MSYS_NO_PATHCONV otherwise volume won't work.
```bash
MSYS_NO_PATHCONV=1 docker run --rm -v $(pwd):/workdir januson/zola build
```
