#!/bin/bash
mkdir -p infrastructure/eks-setup
mkdir -p infrastructure/helm-setup

# Create app directories
mkdir -p apps/xhost-app/helm/templates

# Create files
touch infrastructure/eks-setup/{main.tf,provider.tf,eks.tf,s3.tf,variables.tf}
touch infrastructure/helm-setup/{providers.tf,tekton.tf,argocd.tf,mongodb.tf,ingress.tf,monitoring.tf,microservices.tf}
touch apps/xhost-app/{app.js,package.json,Dockerfile}
touch apps/xhost-app/helm/{Chart.yaml,values.yaml}
touch apps/xhost-app/helm/templates/{deployment.yaml,service.yaml,ingress.yaml}