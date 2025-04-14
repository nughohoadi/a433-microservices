#!/bin/bash

# Set parameter
GITHUB_USERNAME="nughohoadi"
IMAGE_NAME="ghcr.io/$GITHUB_USERNAME/karsajobs-ui:latest"

# Pastikan GITHUB_TOKEN sudah diset sebagai variabel lingkungan atau inputkan secara aman
if [ -z "$GITHUB_TOKEN" ]; then
    echo "⚠️  Variabel GITHUB_TOKEN tidak ditemukan. Masukkan token GitHub Anda:"
    read -s GITHUB_TOKEN
fi

echo "️  Membuat Docker image untuk frontend..."
docker build -t $IMAGE_NAME .

echo " Login ke GitHub Packages..."
echo $GITHUB_TOKEN | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

echo " Push image ke GitHub Packages..."
docker push $IMAGE_NAME

echo "✅ Proses selesai: $IMAGE_NAME"