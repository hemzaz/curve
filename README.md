---

# Curve Project

This repository contains the infrastructure and application setup for the Curve project.

## Directory Structure

- **apps/**: Contains application-related files and configurations.
  - **xhost-app/**: Source code and Helm chart for the xhost-app.
  
- **infrastructure/**: Contains Terraform configurations for various infrastructure components.
  - **bootstrap/**: Initial setup configurations.
  - **ecr/**: Configurations related to the Elastic Container Registry.
  - **eks-setup/**: Configurations for setting up the EKS cluster.
  - **helm-setup/**: Helm charts and configurations for various applications and services.

## Setup

### Using the Makefile

1. To build the Docker image:
   ```bash
   make build-image
   ```

2. To push the Docker image to ECR:
   ```bash
   make push-image
   ```

3. To provision the bootstrap infrastructure:
   ```bash
   make provision-bootstrap
   ```

4. To provision the ECR:
   ```bash
   make provision-ecr
   ```

5. To provision the EKS setup:
   ```bash
   make provision-eks
   ```

6. To provision the Helm setup:
   ```bash
   make provision-helm-setup
   ```

### Without Using the Makefile

For each directory under `infrastructure`, you should navigate to the directory and run the Terraform commands, referencing the `config.tfvars` file located in the `infrastructure` directory:

1. Navigate to the desired directory under `infrastructure`:
   ```bash
   cd infrastructure/<desired-directory>
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Apply the Terraform configurations using the `config.tfvars` file from the `infrastructure` directory:
   ```bash
   terraform apply -var-file=../config.tfvars
   ```

Repeat the above steps for each of the directories (`bootstrap`, `ecr`, `eks-setup`, `helm-setup`) under `infrastructure`.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.

## License

This project is licensed under the MIT License.