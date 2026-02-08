{
  description = "Security Auditor Agent - Security auditing and vulnerability scanning environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Static Analysis (SAST)
            semgrep
            trivy
            # snyk  # Note: Snyk is often installed via npm as snyk-cli

            # Secret Scanning
            gitleaks
            git-secrets

            # Dependency Scanning
            pip-audit
            # cargo-audit

            # Security Auditing
            lynis
            # nikto
            # sqlmap

            # Utilities
            jq
            yq-go
            curl
            git
            gh
          ];

          shellHook = ''
            echo "Security Auditor environment loaded"
            echo ""
            echo "Security Tools:"
            echo "  semgrep      - Static analysis for many languages"
            echo "  trivy        - Vulnerability scanner for containers and files"
            echo "  gitleaks     - Scan for secrets in git history"
            echo "  git-secrets  - Prevents committing secrets"
            echo "  pip-audit    - Audit Python dependencies"
            echo "  lynis        - System security auditing tool"
            echo ""
            echo "Utilities:"
            echo "  jq, yq-go, curl, git, gh"
          '';
        };
      }
    );
}
