# Use Ubuntu 24.04 as the base image
FROM ubuntu:noble

# Install Gitpod's core dependencies (required for workspace functionality)
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git \
    sudo \
    curl \
    wget \
    bash \
    ca-certificates \
    locales \
    openssh-server \
    zsh \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set up locale (required for Gitpod)
RUN locale-gen en_US.UTF-8

# Create Gitpod user (UID 33333 is mandatory for Gitpod)
RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod && \
    echo "gitpod ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/gitpod

# Set up workspace directory (Gitpod expects this)
USER gitpod
WORKDIR /workspace
ENV HOME=/home/gitpod
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Optional: Install additional tools (e.g., Node.js, Python, etc.)
# RUN curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - && \
#     sudo apt-get install -y nodejs
