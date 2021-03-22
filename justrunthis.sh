#!/bin/bash

# Without this Elasticsearch (which is part of Sonarqube) will not run
sudo sysctl -w vm.max_map_count=262144

# Setting podman as default driver for minikube, because docker driver gave me headache once and I avoid to repeat experience
minikube config set driver podman
# Starting minikube and enabling Nginx ingress
minikube start
minikube addons enable ingress

# Deploying all the stuff
terraform init
terraform apply -auto-approve

