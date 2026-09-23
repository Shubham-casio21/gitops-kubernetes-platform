# GitOps Kubernetes Platform

Original portfolio implementation of a GitOps delivery path using GitHub Actions, GHCR, Argo CD and Kubernetes.

## Architecture
Developer push -> GitHub Actions -> test/build -> GHCR -> Kubernetes manifests -> Argo CD -> Kubernetes.

## Production-style features
- Non-root container
- Liveness/readiness probes
- CPU/memory requests and limits
- RollingUpdate with zero unavailable replicas
- Argo CD automated sync, prune and self-heal
- Ingress and isolated namespace

## Run locally
```bash
docker build -t gitops-demo .
docker run --rm -p 8080:8080 gitops-demo
curl http://localhost:8080/healthz
```

## Deploy
1. Install an NGINX ingress controller and Argo CD in a test Kubernetes cluster.
2. Push this repository to `Shubham-casio21/gitops-kubernetes-platform`.
3. Update image tags as part of your release process.
4. Apply `argocd/application.yaml`.
5. Verify with `kubectl -n gitops-demo get deploy,pod,svc,ingress`.

## Rollback / recovery
Git is the source of truth. Revert the manifest commit to a known-good image/configuration; Argo CD reconciles the cluster.
