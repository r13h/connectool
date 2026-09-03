# ConnecTool

ConnecTool defines owner-controlled OIDC and Kubernetes RBAC contracts for
API-only access to independent clusters. It is provider-neutral and does not
federate workloads, Services, Secrets, storage, networking, or tenant data.

The project deliberately has no dependency on a private image registry. The
current Helm chart deploys no container images. Environment-specific OIDC
issuers, consoles, endpoints, and identities are supplied through values.

## Install

```sh
helm install connectool \
  oci://ghcr.io/re8ch/charts/connectool \
  --version 0.1.0 \
  --namespace cluster-access \
  --create-namespace \
  --values my-values.yaml
```

Start with [`charts/connectool/examples/example-values.yaml`](charts/connectool/examples/example-values.yaml).
Every access grant must be reviewed by the target cluster owner. The default
grant list is empty and therefore grants no access.

## Trust boundary

- ConnecTool creates RBAC resources and a credential-free contract record.
- The Kubernetes API server's OIDC configuration is an owner-managed prerequisite.
- ConnecTool creates no tokens, client certificates, tunnels, or static credentials.
- Removing a grant or uninstalling the release revokes the chart-owned RBAC.
- Network reachability and all data-plane sharing are separate decisions.

## Repository layout

- `charts/connectool`: reusable Helm chart
- `docs`: architecture and adopter guidance
- `.github/workflows`: validation and public OCI publishing

See [the architecture boundary](docs/architecture.md) before adding integrations.
