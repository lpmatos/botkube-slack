# Kubectl CLI

Is the Kubernetes command-line tool. Kubectl allows you to run commands against Kubernetes Cluster. You can use kubectl to deploy applications, inspect and manage cluster resources, and view logs.

## Basic Commands

A simples collection of commands usually used with kubectl to get some information in your Cluster.

```bash
kubectl config get-contexts
```

```bash
kubectl config current-context
```

```bash
kubectl config use-context <YOUR CONTEXT>
```

```bash
kubectl get ns
```

```bash
kubectl get pods --all-namespaces -o wide
```

```bash
kubectl get pods -n <SPEFIC NAMESPACE>
```

```bash
kubectl get deployment mysql -n <SPEFIC NAMESPACE> -o yaml
```

```bash
kubectl get services --sort-by=metadata.name -n saas-signo-stage
```

```bash
kubectl get pv --sort-by=spec.capacity.storage -n saas-signo-stage
```
