#!/bin/bash
# Generate RSA key if no key exists
echo "Generating RSA key.."
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa <<< n
