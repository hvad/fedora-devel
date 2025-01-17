FROM fedora:latest
LABEL maintainer="David Hannequin <david.hannequin@gmail.com>"

# Update and install necessary packages for Python, Rust, and Go development
RUN dnf -y update && \
    dnf -y install \
        gcc \
        gcc-c++ \
        make \
        automake \
        cmake \
        python3 \
        python3-pip \
        python3-devel \
        rust \
        cargo \
        golang \
        git \
        vim \
        curl && \
    dnf clean all

# Create a user for development
RUN useradd -m -g wheel -d /home/dev dev && \
    echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Switch to the new user
USER dev

# Set the working directory
WORKDIR /home/dev

# Install SpaceVim
RUN curl -sLf https://spacevim.org/install.sh | bash

# Optional: Install additional Python packages globally
RUN pip3 install --upgrade pip setuptools wheel

# Optional: Install additional Go tools
RUN go install golang.org/x/tools/cmd/goimports@latest

# Optional: Install additional Rust tools
RUN cargo install ripgrep

# Set the default command
CMD ["/bin/bash"]
