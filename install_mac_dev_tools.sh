#!/bin/bash

############################################################################################################################################

### This script will install the following tools:

# Xcode
# Homebrew (if not already installed)
# Git
# zsh 
# Docker
# AWS CLI
# kubectl
# eksctl
# Terraform
# Ansible 
# Jq
# Helm 
# Argocd
# Vault 
# Oh-My-Zsh
# GitHub CLI (gh)
# GitLab CLI (glab)
# Crossplane CLI (kubectl-crossplane)
# Pulumi

### 
chmod +x install_dev_tools.sh

############################################################################################################################################

# Function to check if a command exists
command_exists() {
    command -v "$1" &> /dev/null
}

# Install Homebrew if it's not installed
if ! command_exists brew; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install Xcode command line tools
if ! xcode-select -p &> /dev/null; then
    echo "Installing Xcode command line tools..."
    xcode-select --install
else
    echo "Xcode command line tools are already installed."
fi

# Install Git
if ! command_exists git; then
    echo "Installing Git..."
    brew install git
else
    echo "Git is already installed."
fi

# Install zsh
if ! command_exists zsh; then
    echo "Installing zsh..."
    brew install zsh
else
    echo "zsh is already installed."
fi

# Install Node.js and npm
if ! command_exists node; then
    echo "Installing Node.js and npm..."
    brew install node
else
    echo "Node.js and npm are already installed."
fi

# Install Python
if ! command_exists python3; then
    echo "Installing Python..."
    brew install python
else
    echo "Python is already installed."
fi

# Install Visual Studio Code
if ! command_exists code; then
    echo "Installing Visual Studio Code..."
    brew install --cask visual-studio-code
else
    echo "Visual Studio Code is already installed."
fi

# Install Docker
if ! command_exists docker; then
    echo "Installing Docker..."
    brew install --cask docker
else
    echo "Docker is already installed."
fi

# Install AWS CLI
if ! command_exists aws; then
    echo "Installing AWS CLI..."
    brew install awscli
else
    echo "AWS CLI is already installed."
fi

# Install kubectl
if ! command_exists kubectl; then
    echo "Installing kubectl..."
    brew install kubectl
else
    echo "kubectl is already installed."
fi

# Install eksctl
if ! command_exists eksctl; then
    echo "Installing eksctl..."
    brew tap weaveworks/tap
    brew install weaveworks/tap/eksctl
else
    echo "eksctl is already installed."
fi

# Install Terraform
if ! command_exists terraform; then
    echo "Installing Terraform..."
    brew tap hashicorp/tap
    brew install hashicorp/tap/terraform
else
    echo "Terraform is already installed."
fi

# Install Ansible
if ! command_exists ansible; then
    echo "Installing Ansible..."
    brew install ansible
else
    echo "Ansible is already installed."
fi

# Install jq
if ! command_exists jq; then
    echo "Installing jq..."
    brew install jq
else
    echo "jq is already installed."
fi

# Install Helm
if ! command_exists helm; then
    echo "Installing Helm..."
    brew install helm
else
    echo "Helm is already installed."
fi

# Install ArgoCD
if ! command_exists argocd; then
    echo "Installing ArgoCD..."
    brew install argocd
else
    echo "ArgoCD is already installed."
fi

# Install Vault
if ! command_exists vault; then
    echo "Installing Vault..."
    brew tap hashicorp/tap
    brew install hashicorp/tap/vault
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

# Install GitHub CLI (gh)
if ! command_exists gh; then
    echo "Installing GitHub CLI (gh)..."
    brew install gh
else
    echo "GitHub CLI is already installed."
fi

# Install GitLab CLI (glab)
if ! command_exists glab; then
    echo "Installing GitLab CLI (glab)..."
    brew install glab
else
    echo "GitLab CLI is already installed."
fi

# Install Crossplane CLI (kubectl-crossplane)
if ! command_exists kubectl-crossplane; then
    echo "Installing Crossplane CLI..."
    curl -sL https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh | sh
    sudo mv kubectl-crossplane /usr/local/bin
else
    echo "Crossplane CLI is already installed."
fi

# Install Pulumi
if ! command_exists pulumi; then
    echo "Installing Pulumi..."
    brew install pulumi
else
    echo "Pulumi is already installed."
fi


echo "Development tools installation complete."
