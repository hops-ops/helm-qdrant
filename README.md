# helm-qdrant

Crossplane configuration for deploying [Qdrant](https://qdrant.tech/) vector database via Helm.

## Overview

Qdrant is a high-performance vector similarity search engine and database. It provides a production-ready service with a convenient API to store, search, and manage vectors with additional payloads.

This configuration deploys the Qdrant Helm chart using Crossplane's Helm provider.

## Getting Started

### Minimal Example

```yaml
apiVersion: helm.hops.ops.com.ai/v1alpha1
kind: Qdrant
metadata:
  name: qdrant
  namespace: my-namespace
spec:
  clusterName: my-cluster
```

### Standard Example

```yaml
apiVersion: helm.hops.ops.com.ai/v1alpha1
kind: Qdrant
metadata:
  name: qdrant
  namespace: my-namespace
spec:
  clusterName: my-cluster
  namespace: qdrant
  labels:
    team: platform
    environment: production
  providerConfigRef:
    name: my-cluster
    kind: ProviderConfig
  values:
    replicaCount: 3
    persistence:
      size: 10Gi
```

## Configuration

| Field | Description | Default |
|-------|-------------|---------|
| `spec.clusterName` | Name of the cluster for provider config reference | Required |
| `spec.namespace` | Namespace to deploy Qdrant into | `qdrant` |
| `spec.labels` | Labels to apply to all Kubernetes resources | `{}` |
| `spec.providerConfigRef.name` | Name of the Helm provider config | `clusterName` |
| `spec.providerConfigRef.kind` | Kind of the provider config | `ProviderConfig` |
| `spec.values` | Helm values to merge with defaults | `{}` |
| `spec.overrideAllValues` | Helm values that replace all defaults | `{}` |

## Status

The resource exposes the following status fields:

| Field | Description |
|-------|-------------|
| `status.ready` | Whether the Qdrant deployment is ready |
| `status.release.name` | Name of the Helm release |
| `status.release.namespace` | Namespace of the Helm release |
| `status.release.ready` | Whether the Helm release is deployed |

## Helm Chart

This configuration uses the official Qdrant Helm chart:

- Chart: `qdrant`
- Repository: `https://qdrant.github.io/qdrant-helm`
- Version: `1.16.3`

For available Helm values, see the [Qdrant Helm chart documentation](https://github.com/qdrant/qdrant-helm).
