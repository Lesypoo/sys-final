#!/bin/bash

echo "Starting minikube..."
minikube start --driver=docker --memory=4096 --cpus=2

echo "Applying ConfigMaps..."
kubectl apply -f mysql-configmap.yaml

echo "Applying PV & PVC..."
kubectl apply -f pv.yaml
kubectl apply -f pvc.yaml

echo "Deploying MySQL..."
kubectl apply -f mysql-deployment.yaml

echo "Deploying Jenkins..."
kubectl apply -f jenkins-deployment.yaml

echo "Deploying Nexus..."
kubectl apply -f nexus-deployment.yaml

echo "Deploying Webapp..."
kubectl apply -f webapp-deployment.yaml

echo "Listing all resources..."
kubectl get pods
kubectl get svc
kubectl get deploy
kubectl get configmap
kubectl get pv
kubectl get pvc

echo "Done!"
