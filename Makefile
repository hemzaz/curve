# Variables
REPO_NAME=xhost-app
REGION=us-west-2
ACCOUNT_ID=$(shell aws sts get-caller-identity --query Account --output text)
IMAGE_ADDRESS=$(ACCOUNT_ID).dkr.ecr.$(REGION).amazonaws.com/$(REPO_NAME):latest

# Targets
.PHONY: build-image push-image provision-bootstrap provision-ecr provision-eks provision-helm-setup cleanup

all: build-image push-image provision-bootstrap provision-ecr provision-eks provision-helm-setup

build-image:
	@cd apps/$(REPO_NAME) && docker build -t $(REPO_NAME) .

push-image:
	@if aws ecr describe-repositories --repository-names $(REPO_NAME) 2>&1 | grep -q 'RepositoryNotFoundException'; then \
		echo "Repository does not exist. Proceeding with push."; \
	else \
		echo "Repository exists. Skipping login and push."; \
		exit 0; \
	fi
	@aws ecr get-login-password --region $(REGION) | docker login --username AWS --password-stdin $(ACCOUNT_ID).dkr.ecr.$(REGION).amazonaws.com
	@docker tag $(REPO_NAME):latest $(IMAGE_ADDRESS)
	@docker push $(IMAGE_ADDRESS)

provision-bootstrap:
	@cd infrastructure/bootstrap && terraform init && terraform apply -var-file=../config.tfvars -auto-approve

provision-ecr:
	@cd infrastructure/ecr && terraform init && terraform apply -var-file=../config.tfvars -auto-approve

provision-eks:
	@cd infrastructure/eks-setup && terraform init && terraform apply -var-file=../config.tfvars -auto-approve

provision-helm-setup:
	@if kubectl get ns | grep -q 'helm-setup'; then \
		echo "Helm setup namespace already exists. Skipping provision."; \
		exit 0; \
	fi
	@cd infrastructure/helm-setup && terraform init && terraform apply -var-file=../config.tfvars -auto-approve

cleanup:
	@cd infrastructure/helm-setup && terraform destroy -var-file=../config.tfvars -auto-approve
	@cd infrastructure/eks-setup && terraform destroy -var-file=../config.tfvars -auto-approve
	@cd infrastructure/ecr && terraform destroy -var-file=../config.tfvars -auto-approve
	@cd infrastructure/bootstrap && terraform destroy -var-file=../config.tfvars -auto-approve
