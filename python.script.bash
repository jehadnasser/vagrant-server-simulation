#!/bin/bash
# Install Python 3.7
echo "Installing Python 3.7.."
apt-get update
apt-get install software-properties-common
add-apt-repository ppa:deadsnakes/ppa -y
apt-get install python3.7 -y
