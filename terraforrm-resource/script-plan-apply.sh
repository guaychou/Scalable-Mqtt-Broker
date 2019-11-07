#!/bin/bash
terraform plan
terraform apply --auto-approve
terraform output kubeconfig>~/.kube/config
terraform output config_map_aws_auth > configmap.yml
kubectl apply -f configmap.yml