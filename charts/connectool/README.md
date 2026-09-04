# ConnecTool Helm chart

This chart defines one reviewable AI-tool trust chain:

`client plugin -> OIDC public PKCE client -> ToolHive vMCP -> reviewed MCP workloads`

It creates ToolHive `MCPGroup`, `MCPOIDCConfig`, and `VirtualMCPServer`
resources plus non-secret contracts for OIDC clients, ToolHive Registry sources,
and Codex marketplace/plugin metadata. Skills are distributed by a Git-backed
marketplace; ToolHive distributes MCP capabilities.

The chart does not install an identity provider, mutate its Secret, install
plugins on desktops, or store OAuth tokens. It can optionally publish only the
generated marketplace, plugin, and MCP manifests into a Git repository. Existing
skills and other repository files are preserved, and credentials must be supplied
through a pre-existing Secret. All endpoints, namespaces, registry sources,
publications, authorization policies, marketplace coordinates, and optional
ToolHive Registry settings are values-controlled.

Each publication may pass a `podTemplateSpec` to its `VirtualMCPServer`, for
example to select a node with the required network path to an external issuer.

```sh
helm lint . -f examples/example-values.yaml
helm template connectool . -n connectool -f examples/example-values.yaml
```

To enable Git publication, set `codex.marketplace.publisher.enabled`, use the
same HTTPS repository for `source` and `publisher.repository`, and provide a
least-privilege credential Secret. The scheduled publisher commits only when
generated files change.

## Public delivery

The canonical OCI artifact is:

```text
oci://ghcr.io/re8ch/charts/connectool
```

The GitHub release tag is `v<Chart.yaml version>`. GitHub Actions validates,
packages, and publishes the immutable SemVer OCI artifact. Deployments may use
any OCI mirror, but no private mirror is an upstream dependency.

RE8CH endpoints, identities, policies, and infrastructure values live only in
the downstream service-backend overlay.
