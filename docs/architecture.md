# Architecture boundary

ConnecTool owns a small, portable owner-side contract:

1. describe an independent target cluster and its OIDC consumer;
2. create only the explicitly reviewed Kubernetes RBAC grants;
3. record the credential-free access contract in a ConfigMap;
4. fail closed when no grants are supplied.

It does not own OIDC provider installation, API-server flags, network tunnels,
service discovery, workload federation, storage, or secret distribution.

## Configuration boundary

The upstream chart contains portable schema and templates. Each adopter keeps a
separate values overlay containing its issuer URL, consumer name, API endpoint,
username mapping, and subjects. Organizational overlays are not upstream examples.

The canonical package is published at:

```text
oci://ghcr.io/re8ch/charts/connectool
```

Deployments may mirror that artifact to Harbor, ECR, GAR, ACR, or another OCI
registry, but mirrors are optional transport details. They must never be embedded
in the chart templates or defaults.

## Future controllers and AI tools

If a future controller or AI tool introduces a container image, its values must
separate `registry`, `repository`, `tag`, and `digest`. The default public image
must be usable without private credentials, and production consumers should be
able to pin a digest or override all image coordinates.

Provider integrations belong behind explicit, optional adapters. Core APIs and
values must remain usable with any conforming Kubernetes cluster and OIDC issuer.
