# Security policy

Please report security issues privately through GitHub's security advisory feature.
Do not open a public issue containing credentials or exploitable details.

ConnecTool must never store or generate bearer tokens, OAuth refresh tokens,
private keys, client certificates, or remote ServiceAccount credentials.
Authorization policies and referenced MCP workloads should follow least privilege.
