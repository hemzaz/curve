# Variables
REPO_NAME=xhost-app
REGION=us-west-2
ACCOUNT_ID=$(shell aws sts get-caller-identity --query Account --output text)
IMAGE_ADDRESS=$(ACCOUNT_ID).dkr.ecr.$(REGION).amazonaws.com/$(REPO_NAME):latest

# Targets
.PHONY: build-image push-image provision-eks deploy-helm destroy-eks

all: provision-eks deploy-helm

build-image:
	@cd apps/$(REPO_NAME) && ./build_and_push.sh Build

push-image:
	@cd apps/$(REPO_NAME) && ./build_and_push.sh Push

provision-eks:
	@cd infrastructure/eks-setup && terraform init && terraform apply -auto-approve

deploy-helm:
	@helm repo add stable https://charts.helm.sh/stable
	@helm install mongodb stable/mongodb --set mongodbRootPassword=secretpassword,mongodbUsername=my-user,mongodbPassword=my-password,mongodbDatabase=my-database
	@helm install xhost-app ./apps/$(REPO_NAME)/helm --set image.repository=$(IMAGE_ADDRESS)

destroy-eks:
	@cd infrastructure/eks-setup && terraform destroy -auto-approve
