#!/bin/bash

# Directories to be created
dirs=(
    "infrastructure/bootstrap"
    "infrastructure/ecr"
    "infrastructure/eks-setup"
    "infrastructure/helm-setup"
    "apps/xhost-app/helm/templates"
)

# Files to be created
declare -A files=(
    ["infrastructure/bootstrap"]="main.tf variables.tf"
    ["infrastructure/ecr"]="auth.tf main.tf variables.tf"
    ["infrastructure/eks-setup"]="backend.tf eks.tf main.tf provider.tf s3.tf variables.tf"
    ["infrastructure/helm-setup"]="argocd.tf ingress.tf main.tf microservices.tf mongodb.tf monitoring.tf providers.tf tekton.tf variables.tf"
    ["apps/xhost-app"]="Dockerfile app.js build_and_push.sh package.json"
    ["apps/xhost-app/helm"]="Chart.yaml values.yaml"
    ["apps/xhost-app/helm/templates"]="deployment.yaml service.yaml ingress.yaml"
)

# Create directories
for dir in "${dirs[@]}"; do
    mkdir -p "$dir"
done

# Create files
for dir in "${!files[@]}"; do
    echo "${files[$dir]}" | xargs -I {} touch "$dir/{}"
done

# Create standalone files
touch "infrastructure/config.tfvars"
