#!/bin/bash
echo "Starting GSC Portal deployment..."

# 1. 최신 이미지 가져오기 (pull 추가)
docker compose -f docker-compose.prod.yml pull

# 2. 컨테이너 재시작 (up -d 추가)
docker compose -f docker-compose.prod.yml up -d

# 3. 불필요한 이미지 정리
docker image prune -f 

echo "Deployment completed"