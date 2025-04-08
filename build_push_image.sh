#!/bin/bash

# Hentikan eksekusi jika ada perintah yang gagal
set -e

# Nama user Docker Hub kamu
DOCKER_USERNAME=nugrohoadi

# Nama image dan tag
IMAGE_NAME=item-app
IMAGE_TAG=v1
FULL_IMAGE_NAME=$DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG

# 1. Build Docker image
echo "Membuat Docker image..."
docker build -t $IMAGE_NAME:$IMAGE_TAG .

# 2. Lihat daftar image di lokal
echo "Daftar Docker image lokal:"
docker images

# 3. Rename/tag image agar sesuai format Docker Hub
echo "Menandai image dengan nama lengkap: $FULL_IMAGE_NAME"
docker tag $IMAGE_NAME:$IMAGE_TAG $FULL_IMAGE_NAME

# 4. Login ke Docker Hub
echo "Login ke Docker Hub..."
echo $PASSWORD_DOCKER_HUB | docker login -u $DOCKER_USERNAME --password-stdin

# 5. Push image ke Docker Hub
echo "Push image ke Docker Hub..."
docker push $FULL_IMAGE_NAME

echo "Selesai. Image berhasil di-push ke $FULL_IMAGE_NAME"
