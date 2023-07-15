The task is to deploy Sonarqube application Helm chart to Minikube. It was implemented on Ubuntu 20 machine.

Elasticsearch needs seccomp filter available, to check if it's vailable on your kernel, run:
grep SECCOMP /boot/config-$(uname -r)

If it's there, you'll see:
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP_FILTER=y
CONFIG_SECCOMP=y

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

Make sure your machine is not 1Gb RAM (should be at least 4Gb).

When everything is ready run justrunthis.sh script (run "chmod 755" for the script before, for the previous one also, if you decide to risk).

