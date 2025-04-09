#!/bin/bash

# Ganti ini dengan username Docker Hub Anda
DOCKER_USERNAME="nugrohoadi"
IMAGE_NAME="$DOCKER_USERNAME/karsajobs-ui:latest"

echo "🛠️  Membuat Docker image untuk frontend..."
docker build -t $IMAGE_NAME .

echo "🔐 Login ke Docker Hub..."
echo $PASSWORD_DOCKER_HUB | docker login -u $DOCKER_USERNAME --password-stdin

echo "📤 Push image ke Docker Hub..."
docker push $IMAGE_NAME

echo "✅ Proses selesai: $IMAGE_NAME"
