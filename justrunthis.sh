#!/bin/bash

# Without this Elasticsearch (which is part of Sonarqube) will not run, but it was like that on CentOS
# sudo sysctl -w vm.max_map_count=262144

# Setting docker as default driver for minikube
minikube config set driver docker
# Starting minikube and enabling Nginx ingress
minikube start
minikube addons enable ingress

# Deploying all the stuff
terraform init
terraform apply -auto-approve

# Configuring ingress
minikube kubectl -- apply -f ingress.yaml
minikubeip=$(minikube ip)
echo "Sonarqube URL: https://$minikubeip/sonarqube/"
