The task is to deploy Sonarqube application Helm chart to Minikube. It was implemented on Ubuntu 20 machine.<br>
The implementation is valid for 2023.

Elasticsearch (which is part of Sonarqube) needs seccomp filter available, to check if it's vailable on your kernel, run:<br>
grep SECCOMP /boot/config-$(uname -r)

If it's there, you'll see:<br>
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y<br>
CONFIG_SECCOMP_FILTER=y<br>
CONFIG_SECCOMP=y<br>

If you install kubectl with Minikube, unless you create an alias, you will need to use "minikube kubectl -- [your_kubectl_command]" in place of just "kubectl [your_kubectl_command]".

Clone the repo and cd into it (you need Git to be installed on your machine, on Ubuntu 20 it's there already)

To run stuff you will need installed:

1. Docker engine (you can use VirtualBox instead, but depending on how you run your machine, you can have issues with starting Minikube on VirtualBox)
2. Minikube
3. Kubectl
5. Helm
6. Terraform

OR

you can run script risky.sh which maybe will install everything successfully
(risky, as it says, and it will work for Debian and Ubuntu machines (OS versions since 2014) with AMD64 processor architecture).

Make sure your machine is not 1Gb RAM (should be at least 4Gb; they say 8Gb is even better, because Sonarqube chart memory limit shouldn't be under 4Gb).

When everything is ready run justrunthis.sh script (run "chmod 755" for the script before, for the previous one also, if you decide to risk).

