#!/bin/bash

REPO_NAME="xhost-app"
REGION="us-west-2"
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

function build() {
  docker build -t $REPO_NAME .
}

function push() {
  $(aws ecr get-login --no-include-email --region $REGION)
  docker tag $REPO_NAME:latest $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:latest
  aws ecr describe-repositories --repository-names $REPO_NAME || aws ecr create-repository --repository-name $REPO_NAME
  docker push $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:latest
  echo "Image Address: $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:latest"

  # Update the existing value in config.tfvars with the ECR repo name
  # Check for OS type to handle sed command differences
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS uses BSD sed
    sed -i "" "s|app_image_repository =.*|app_image_repository = \"$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME\"|" ../../infrastructure/config.tfvars
  else
    # Linux uses GNU sed
    sed -i "s|app_image_repository =.*|app_image_repository = \"$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME\"|" ../../infrastructure/config.tfvars
  fi
}

case "$1" in
  Build)
    build
    ;;
  Push)
    build
    push
    ;;
  *)
    echo "Usage: $0 {Build|Push}"
esac
