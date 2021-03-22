#!/bin/bash

# Installing Docker engine
sudo yum -y install yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum -y install docker-ce docker-ce-cli containerd.io

# Installing kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/bin/kubectl

# Installing minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo install minikube /usr/bin/

# Installing podman (driver for minikube)
sudo curl -Lo /etc/yum.repos.d/devel:kubic:libcontainers:stable.repo https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/CentOS_7/devel:kubic:libcontainers:stable.repo
sudo yum -y install podman

# Installing Helm (also wget, because curl didn't work properly in this case, but who cares why, we need result)
sudo yum -y install wget
wget https://get.helm.sh/helm-v3.5.3-linux-amd64.tar.gz
tar -zxvf helm-v3.5.3-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/bin/helm

# Installing Terraform
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform

