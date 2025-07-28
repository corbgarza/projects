#!/usr/bin/env bash
sudo apt install -y linux-headers-amd64 && \
sudo sed -i 's/trixie main/trixie main contrib non-free non-free-firmware/1' /etc/apt/sources.list && \
sudo apt update && sudo apt upgrade -y && \
sudo apt install -y nvidia-kernel-dkms nvidia-driver firmware-misc-nonfree
