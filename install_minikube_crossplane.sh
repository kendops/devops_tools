#!/bin/bash

# --------------------------------------------------------------------
# This script installs Minikube, kubectl, and Crossplane on Ubuntu
# Author: [Your Name]
# --------------------------------------------------------------------

set -e

echo "🚀 Starting Minikube and Crossplane setup on Ubuntu..."

# ---------------- Step 1: Install dependencies ----------------
echo "🔧 Installing dependencies..."
sudo apt update
sudo apt install -y curl apt-transport-https virtualbox virtualbox-ext-pack

# ---------------- Step 2: Install Minikube ----------------
echo "📦 Installing Minikube..."
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64
minikube version

# ---------------- Step 3: Start Minikube ----------------
echo "🚀 Starting Minikube cluster..."
minikube start --driver=virtualbox

# ---------------- Step 4: Install kubectl ----------------
echo "🔧 Installing kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version --client

# ---------------- Step 5: Install Helm ----------------
echo "🎯 Installing Helm..."
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt install -y helm

# ---------------- Step 6: Install Crossplane ----------------
echo "📦 Installing Crossplane via Helm..."
kubectl create namespace crossplane-system
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update
helm install crossplane crossplane-stable/crossplane --namespace crossplane-system

echo "⏳ Waiting for Crossplane pods to be ready..."
kubectl wait --for=condition=Available deployment/crossplane -n crossplane-system --timeout=180s

# ---------------- Step 7: Install Crossplane CLI ----------------
echo "🔧 Installing Crossplane CLI..."
curl -sL https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh | sh
sudo mv kubectl-crossplane /usr/local/bin
kubectl crossplane --help

echo "✅ Minikube and Crossplane setup complete!"
