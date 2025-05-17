FROM gitpod/workspace-full  # Base image with many preinstalled tools

# Install additional tools (e.g., PostgreSQL client)
RUN sudo apt-get update && \
    sudo apt-get install -y postgresql-client && \
    sudo rm -rf /var/lib/apt/lists/*
