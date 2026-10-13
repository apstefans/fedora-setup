#!/usr/bin/env bash

set -e

# Update the system

sudo dnf update

# Development

sudo dnf install -y \
	git \
	gcc \
	gcc-c++ \
	make \
	cmake \
	gdb \
	clang \
	vim \
	python3-pip \
	python3-devel \
	pipx \
	gh \
	unzip \
	zip \
	tar \
	shellcheck 


# Linux System

sudo dnf install -y \
	stow \
	curl \
	wget \
	ripgrep \
	fzf \
	fd-find \
	bat \
	eza \
	btop \
	fastfetch \
	neovim \
	tmux \
	tldr \
	zoxide 

# Electronics

sudo dnf install -y \
	kicad \
	gtkwave \
	iverilog

# Containers

sudo dnf install -y \
	podman \
	podman-docker \
	podman-compose
