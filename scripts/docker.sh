#! /bin/bash
echo "> Installing Docker..."

curl -sSL https://get.docker.com | sh
usermod -aG docker pi