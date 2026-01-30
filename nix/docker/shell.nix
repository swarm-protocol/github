{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Docker and container tools
    docker
    docker-compose
    docker-buildx
    dive  # Docker image analyzer

    # Kubernetes tools
    kubectl
    kubernetes-helm
    kustomize
    k9s

    # Container security scanning
    trivy
    
    # Dockerfile linter
    hadolint

    # YAML tools
    yq-go
    yamllint
    yamlfmt

    # CI/CD tools
    gh
    git

    # Container registries
    skopeo
    podman

    # Utilities
    jq
    curl
    gnumake
  ];

  shellHook = ''
    echo "Docker Specialist environment loaded"
    echo ""
    echo "Container tools:"
    echo "  docker         - Docker CLI"
    echo "  docker-compose - Multi-container applications"
    echo "  podman         - Daemonless container engine"
    echo "  dive           - Analyze Docker image layers"
    echo ""
    echo "Kubernetes tools:"
    echo "  kubectl        - Kubernetes CLI"
    echo "  helm           - Package manager for Kubernetes"
    echo "  kustomize      - Kubernetes configuration management"
    echo "  k9s            - Terminal UI for Kubernetes"
    echo ""
    echo "Security & Quality:"
    echo "  trivy          - Vulnerability scanner"
    echo "  hadolint       - Dockerfile linter"
    echo "  yamllint       - YAML linter"
  '';
}
