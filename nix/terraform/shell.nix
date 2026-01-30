{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Terraform and related tools
    terraform
    terraform-docs
    terraform-ls  # Language server
    tflint
    tfsec  # Security scanner
    terrascan  # Security/compliance scanner
    checkov  # Policy as code scanner
    infracost  # Cost estimation

    # Terragrunt (Terraform wrapper)
    terragrunt

    # Cloud provider CLIs
    awscli2  # AWS CLI
    google-cloud-sdk  # GCP CLI (gcloud)
    azure-cli  # Azure CLI

    # Kubernetes tools (for k8s providers)
    kubectl
    kubernetes-helm

    # JSON/YAML tools
    jq
    yq-go
    yamllint

    # GraphViz for terraform graph
    graphviz

    # Version control
    git
    gh
    git-crypt  # For secrets

    # Text editors
    vim
    nano

    # Vault for secrets management
    vault

    # Packer for image building
    packer

    # Ansible for configuration
    ansible

    # Code quality
    shellcheck
    pre-commit

    # Utilities
    curl
    wget
    gnumake
    ripgrep
    fd
    tree
  ];

  shellHook = ''
    echo "Terraform development environment loaded"
    echo ""
    echo "Infrastructure as Code:"
    echo "  terraform      - $(terraform version | head -n1)"
    echo "  terragrunt     - Terraform wrapper for DRY configs"
    echo "  terraform-docs - Generate documentation"
    echo "  tflint         - Linter for Terraform"
    echo ""
    echo "Security & Compliance:"
    echo "  tfsec          - Security scanner"
    echo "  terrascan      - Policy scanner"
    echo "  checkov        - Security/compliance checker"
    echo "  infracost      - Cost estimation"
    echo ""
    echo "Cloud CLIs:"
    echo "  aws            - AWS CLI v2"
    echo "  gcloud         - Google Cloud SDK"
    echo "  az             - Azure CLI"
    echo ""
    echo "Additional tools:"
    echo "  kubectl        - Kubernetes CLI"
    echo "  helm           - Kubernetes package manager"
    echo "  vault          - HashiCorp Vault"
    echo "  packer         - Image builder"
    echo "  ansible        - Configuration management"
    echo ""
    echo "Workflow commands:"
    echo "  terraform init      - Initialize working directory"
    echo "  terraform plan      - Show execution plan"
    echo "  terraform apply     - Apply changes"
    echo "  terraform destroy   - Destroy infrastructure"
    echo "  terraform validate  - Validate configuration"
    echo "  terraform fmt       - Format code"
    echo "  terraform graph     - Generate dependency graph"
    echo "  tfsec .             - Run security scan"
    echo "  infracost breakdown - Estimate costs"
  '';
}
