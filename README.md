The task is to deploy Sonarqube application Helm chart to Minikube. It was implemented on Ubuntu 20 machine.<br>
The implementation is valid in 2023.<br>
Separate Helm chart is used for PostgreSQL database (there is one included in Sonarqube chart if it works for you).

Elasticsearch (which is part of Sonarqube) needs seccomp filter available, to check if it's vailable on your kernel, run:<br>
grep SECCOMP /boot/config-$(uname -r)

If it's there, you'll see:<br>
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y<br>
CONFIG_SECCOMP_FILTER=y<br>
CONFIG_SECCOMP=y<br>

If you install kubectl with Minikube, unless you create an alias, you will need to use "minikube kubectl -- [your_kubectl_command]" in place of just "kubectl [your_kubectl_command]".

To run stuff you will need to prepare the cluster and have installed:

1. Docker engine (you can use VirtualBox instead, but depending on how you run your machine, you can have issues with starting Minikube on VirtualBox)
2. Minikube
3. Kubectl
5. Helm
6. Terraform

You can check RunThisManuallyCommandByCommand.sh to prepare the cluster (this will work for Debian and Ubuntu machines (OS versions since 2014) with AMD64 processor architecture).

Make sure your machine is not 1Gb RAM (should be at least 4Gb; they say 8Gb is even better, because Sonarqube chart memory limit shouldn't be under 4Gb).

Clone the repo and cd into it (you need Git to be installed on your machine, on Ubuntu 20 it's there already).

When everything is ready run justrunthis.sh script (run "chmod 755" for the script before).

If script in the end says that Kubernetes cluster is unreachable, give it few minutes, it will be.
Sad part, if this happens, you will need to run ingress apply command manually, it won't be executed in script.

Sonarqube pod likes attention, and it can be running, but not ready in the beginning. Give it some minutes also, it will be operational.
