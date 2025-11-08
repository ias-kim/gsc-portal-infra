#!/bin/bash
echo "Starting GSC Portal deployment..."

# 1. 최신 이미지 가져오기
docker compose -f docker-compose.prod.yml

# 2. 컨테이너 재시작
docker compose -f docker-compose.prod.yml

# 3. 불필요한 이미지 정리
docker image prune -f 

echo "Deployment completed"
