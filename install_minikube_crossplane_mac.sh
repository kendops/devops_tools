#!/bin/bash

# --------------------------------------------------------------------
# This script installs Minikube, kubectl, and Crossplane on macOS
# Author: [Your Name]
# --------------------------------------------------------------------

set -e

echo "🚀 Starting Minikube and Crossplane setup on macOS..."

# ---------------- Step 1: Install Homebrew ----------------
if ! command -v brew &>/dev/null; then
  echo "🔧 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew is already installed."
fi

# ---------------- Step 2: Install dependencies ----------------
echo "📦 Installing Minikube, kubectl, helm..."
brew install minikube kubectl helm

# ---------------- Step 3: Start Minikube ----------------
echo "🚀 Starting Minikube cluster..."
minikube start --driver=hyperkit || minikube start --driver=docker

# ---------------- Step 4: Install Crossplane ----------------
echo "📦 Installing Crossplane via Helm..."
kubectl create namespace crossplane-system --dry-run=client -o yaml | kubectl apply -f -
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update
helm install crossplane crossplane-stable/crossplane --namespace crossplane-system

echo "⏳ Waiting for Crossplane pods to be ready..."
kubectl wait --for=condition=Available deployment/crossplane -n crossplane-system --timeout=180s

# ---------------- Step 5: Install Crossplane CLI ----------------
echo "🔧 Installing Crossplane CLI..."
curl -sL https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh | sh
sudo mv kubectl-crossplane /usr/local/bin
kubectl crossplane --help

echo "✅ Minikube and Crossplane setup complete on macOS!"
