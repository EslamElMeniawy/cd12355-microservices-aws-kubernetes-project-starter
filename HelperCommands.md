# Helper Commands

## Create Cluster

```bash
eksctl create cluster --name coworking-space --region us-east-1 --nodegroup-name coworking-space --node-type t3.small --nodes 1 --nodes-min 1 --nodes-max 2
```

## Configure `kubectl` Cluster

```bash
aws eks --region us-east-1 update-kubeconfig --name coworking-space
```

## Verify Configuration

```bash
kubectl config current-context
```

```bash
kubectl config view
```

## Verify Connection

```bash
kubectl get nodes
```

## Create Persistent Volume & Claim

```bash
kubectl apply -f deployment/pv.yaml
kubectl apply -f deployment/pvc.yaml
```

## Deploy PostgreSQL

```bash
kubectl apply -f deployment/postgresql-deployment.yaml
kubectl apply -f deployment/postgresql-service.yaml
```

## Verify PostgreSQL Running

```bash
kubectl get pods -l app=postgresql
kubectl get svc postgresql-service
```

## Deploy ConfigMap Secret

```bash
kubectl apply -f deployment/configmap.yaml
```

## Deploy Application

```bash
kubectl apply -f deployment/coworking.yaml
```

## Check Application Running

```bash
kubectl get pods -l service=coworking
kubectl get svc coworking
```

## Delete Cluster

```bash
eksctl delete cluster --name coworking-space --region us-east-1
```