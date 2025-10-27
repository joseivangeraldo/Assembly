# Use a lightweight Linux distribution as the base image.
# We'll use Ubuntu for its familiar package manager.
FROM ubuntu:24.04

# Set a non-root user.
ARG USERNAME=vscode
ARG GROUPNAME=vscode
ARG USER_UID=1000
ARG USER_GID=1000

# Create the user.
RUN groupadd --gid $USER_GID $GROUPNAME && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME && apt-get update && apt-get install -y sudo && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME && chmod 0440 /etc/sudoers.d/$USERNAME

# Switch to the new user.
USER $USERNAME

# Install NASM, build-essential (for GCC/linker), and Git.
# 'build-essential' is a meta-package that pulls in all the tools needed for building.
RUN sudo apt-get update && sudo apt-get install -y \
    nasm \
    build-essential \
    git \
    && sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/*

# Set the working directory for the user.
WORKDIR /home/$USERNAME