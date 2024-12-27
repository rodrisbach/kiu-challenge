# kiu-challenge

## Overview

kiu-challenge is a project aimed at providing an infrastructure setup using Terraform and Kubernetes. This repository includes resources to configure and deploy an EKS cluster on AWS.

## Repository Structure

```
kiu-challenge
├── app/ # Application-related files 
├── envs/ # Environment-specific configurations 
├── kubernetes/ # Kubernetes manifests and configurations
├── certificate_and_dns.tf # TLS and DNS setup 
├── database.tf # Database provisioning 
├── locals.tf # Local variables for Terraform 
├── main.tf # Main Terraform configuration 
├── providers.tf # Cloud provider configurations 
├── state.tf # Remote state management 
├── terraform.tf # Terraform backend configuration 
├── variables.tf # Input variables for Terraform 
└── terra.sh # Shell script for Terraform commands
```

## Getting Started

### Prerequisites
- AWS CLI installed and configured
- Terraform version 1.5.0 or higher
- kubectl installed

### Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/rodrisbach/kiu-challenge.git
   cd kiu-challenge

2. Create a AWS S3 bucket to store the Terraform artifacts and create a DynamoDB table. Update the *state.tf* file with the name of the resources created recently.

3. Configure AWS CLI
    ```bash
    aws configure
    ```

4. Initialize Terraform:
    ```bash
    terraform init
    ```

5. Apply the Terraform scripts:
    ```bash
    ./terra.sh dev
    ```

## To Do List

* Check AWS IAM roles used by EKS nodes.
* Check Nginx-ingress TLS/SSL configuration
* Configure EKS authentication for AWS IAM users.