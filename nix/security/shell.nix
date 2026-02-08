{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Static Analysis (SAST)
    semgrep
    trivy

    # Secret Scanning
    gitleaks
    git-secrets

    # Dependency Scanning
    pip-audit

    # Security Auditing
    lynis

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
}
