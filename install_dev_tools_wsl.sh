#!/bin/bash

############################################################################################################################################

# 1. Instructions to Run the Script:
# 2. Open a terminal on your Ubuntu.
# 3. Create a new file with the .sh extension, for example, install_dev_tools.sh.
# 4. Copy and paste the script above into this file.
# 5. Save the file and close the editor.
# 6. Make the script executable by running:

### Run the script:
# 7. chmod +x ./install_dev_tools_wsl.sh
# 8. ./install_dev_tools_wsl.sh
############################################################################################################################################

#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" &> /dev/null
}

# Update package list
sudo apt update

# Install Git
if ! command_exists git; then
    echo "Installing Git..."
    sudo apt install -y git
else
    echo "Git is already installed."
fi

# Install zsh
if ! command_exists zsh; then
    echo "Installing zsh..."
    sudo apt install -y zsh
else
    echo "zsh is already installed."
fi

# Install Node.js and npm
if ! command_exists node; then
    echo "Installing Node.js and npm..."
    curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt install -y nodejs
else
    echo "Node.js and npm are already installed."
fi

# Install Python
if ! command_exists python3; then
    echo "Installing Python..."
    sudo apt install -y python3 python3-pip
else
    echo "Python is already installed."
fi

# Install Visual Studio Code
if ! command_exists code; then
    echo "Installing Visual Studio Code..."
    sudo apt install -y software-properties-common apt-transport-https wget
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt update
    sudo apt install -y code
else
    echo "Visual Studio Code is already installed."
fi

# Install Docker
if ! command_exists docker; then
    echo "Installing Docker..."
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt update
    sudo apt install -y docker-ce
    sudo usermod -aG docker ${USER}
else
    echo "Docker is already installed."
fi

# Install AWS CLI
if ! command_exists aws; then
    echo "Installing AWS CLI..."
    sudo apt install curl unzip
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
else
    echo "AWS CLI is already installed."
fi

# Install kubectl
if ! command_exists kubectl; then
    echo "Installing kubectl..."
    sudo apt install -y apt-transport-https
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    sudo bash -c 'cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF'
    sudo apt update
    sudo apt install -y kubectl
else
    echo "kubectl is already installed."
fi

# Install eksctl
if ! command_exists eksctl; then
    echo "Installing eksctl..."
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
    sudo mv /tmp/eksctl /usr/local/bin
else
    echo "eksctl is already installed."
fi

# Install Terraform
if ! command_exists terraform; then
    echo "Installing Terraform..."
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt update
    sudo apt install -y terraform
else
    echo "Terraform is already installed."
fi

# Install Ansible
if ! command_exists ansible; then
    echo "Installing Ansible..."
    sudo apt update
    sudo apt install -y ansible
else
    echo "Ansible is already installed."
fi

# Install jq
if ! command_exists jq; then
    echo "Installing jq..."
    sudo apt install -y jq
else
    echo "jq is already installed."
fi

# Install Helm
if ! command_exists helm; then
    echo "Installing Helm..."
    curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
    sudo apt-add-repository "deb https://baltocdn.com/helm/stable/debian/ all main"
    sudo apt update
    sudo apt install -y helm
else
    echo "Helm is already installed."
fi

# Install ArgoCD
if ! command_exists argocd; then
    echo "Installing ArgoCD..."
    sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
    sudo chmod +x /usr/local/bin/argocd
else
    echo "ArgoCD is already installed."
fi

# Install Crossplane CLI
if ! command_exists kubectl-crossplane; then
    echo "Installing Crossplane CLI..."
    curl -sL https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh | sh
    sudo mv kubectl-crossplane /usr/local/bin
else
    echo "Crossplane CLI is already installed."
fi

# Install Vault
if ! command_exists vault; then
    echo "Installing Vault..."
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt update
    sudo apt install -y vault
else
    echo "Vault is already installed."
fi


# Install Oh-My-Zsh
if [ "$SHELL" != "/bin/zsh" ] && [ "$SHELL" != "/usr/bin/zsh" ]; then
    echo "Changing the default shell to zsh..."
    chsh -s $(which zsh)
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh-My-Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh-My-Zsh is already installed."
fi

echo "Development tools installation complete."


############################################################################################################################################

### This script will install the following tools:

# Xcode
# Homebrew (if not already installed)
# Git
# zsh 
# Node.js and npm
# Python
# Visual Studio Code
# Docker
# AWS CLI
# kubectl
# eksctl
# Terraform
# Ansible 
# JQuery  
# Helm 
# Argocd
# Install Crossplane
# Vault 
# Oh-My-Zsh

############################################################################################################################################
