# Security policy

Please report security issues privately through GitHub's security advisory feature.
Do not open a public issue containing credentials or exploitable details.

ConnecTool must never store or generate bearer tokens, private keys, client
certificates, or remote ServiceAccount credentials. Access grants should prefer
least-privilege groups over direct human `cluster-admin` bindings.
