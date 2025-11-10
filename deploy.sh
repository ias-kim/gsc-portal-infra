#!/bin/bash
set -e 

SERVICE_NAME=$1 # "backend" 또는 "frontend" 인자를 받음

if [ -z "$SERVICE_NAME" ]; then
  echo "Error: 배포할 서비스 이름을 입력해야 합니다."
  echo "Usage: ./deploy.sh [SERVICE_NAME]"
  exit 1
fi

echo "--- Deploying service: $SERVICE_NAME ---"

# 1. 특정 서비스의 최신 이미지만 pull
sudo docker compose -f docker-compose.prod.yml pull $SERVICE_NAME

# 2. 특정 서비스만 재시작 
sudo docker compose -f docker-compose.prod.yml up -d --no-deps $SERVICE_NAME

# 3. 불필요한 이미지 정리
sudo docker image prune -f

echo "--- Deployment of $SERVICE_NAME completed ---"