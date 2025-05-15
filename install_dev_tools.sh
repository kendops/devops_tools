#!/bin/bash

set -e
export DEBIAN_FRONTEND=noninteractive

echo "🔧 Updating packages..."
sudo apt update -y
sudo apt install -y \
    git \
    curl \
    unzip \
    bash \
    jq \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release

# Install Docker
if ! command -v docker &> /dev/null; then
    echo "🔧 Installing Docker..."
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    yes "" | sudo add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt update
    sudo apt install -y docker-ce
    sudo usermod -aG docker $USER
fi

# Install AWS CLI
if ! command -v aws &> /dev/null; then
    echo "🔧 Installing AWS CLI..."
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    rm -rf aws awscliv2.zip
fi

# Install kubectl
if ! command -v kubectl &> /dev/null; then
    echo "🔧 Installing kubectl..."
    curl -fsSLo kubectl https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
    chmod +x kubectl && sudo mv kubectl /usr/local/bin/
fi

# Install eksctl
if ! command -v eksctl &> /dev/null; then
    echo "🔧 Installing eksctl..."
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz
    sudo mv eksctl /usr/local/bin
fi

# Install Terraform
if ! command -v terraform &> /dev/null; then
    echo "🔧 Installing Terraform..."
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    yes "" | sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt update
    sudo apt install -y terraform
fi

# Install Ansible
if ! command -v ansible &> /dev/null; then
    echo "🔧 Installing Ansible..."
    sudo apt install -y ansible
fi

# Install Helm
if ! command -v helm &> /dev/null; then
    echo "🔧 Installing Helm..."
    curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
    yes "" | sudo apt-add-repository "deb https://baltocdn.com/helm/stable/debian/ all main"
    sudo apt update
    sudo apt install -y helm
fi

# Install ArgoCD CLI
if ! command -v argocd &> /dev/null; then
    echo "🔧 Installing ArgoCD..."
    curl -sSL -o argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
    chmod +x argocd && sudo mv argocd /usr/local/bin/
fi

# Install Crossplane CLI
if ! command -v kubectl-crossplane &> /dev/null; then
    echo "🔧 Installing Crossplane CLI..."
    curl -sL https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh | sh
    sudo mv kubectl-crossplane /usr/local/bin
fi

# Install Vault
if ! command -v vault &> /dev/null; then
    echo "🔧 Installing Vault..."
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    yes "" | sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt update
    sudo apt install -y vault
fi

# Install jq
if ! command -v jq &> /dev/null; then
    echo "🔧 Installing jq..."
    sudo apt install -y jq
fi

echo "✅ All tools installed successfully!"
