#!/bin/bash

ENV=$@
VAR_FILE="envs/$ENV.tfvars"

echo $ENV
echo $VAR_FILE

terraform workspace select $ENV && terraform apply -var-file="${$VAR_FILE}"