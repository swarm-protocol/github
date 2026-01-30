{
  description = "Ansible Utilities - Infrastructure automation and configuration management environment";

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
            # Ansible core
            ansible
            ansible-lint
            ansible-language-server

            # Python (required for Ansible)
            python311
            python311Packages.pip
            python311Packages.jmespath
            python311Packages.netaddr
            python311Packages.passlib
            python311Packages.boto3        # AWS
            python311Packages.google-api-python-client  # GCP
            python311Packages.azure-mgmt-resource  # Azure

            # Testing
            python311Packages.molecule
            python311Packages.pytest
            python311Packages.pytest-testinfra

            # YAML/JSON tools
            yamllint
            yq-go
            jq

            # SSH and connectivity
            openssh
            sshpass

            # Container tools (for Molecule)
            docker
            docker-compose

            # Cloud CLIs
            awscli2
            google-cloud-sdk
            azure-cli

            # Version control
            git
            gh
            pre-commit

            # Text editors
            vim
            nano

            # Utilities
            curl
            wget
            gnumake
            ripgrep
            fd
            tree
            pwgen         # Password generation
            age           # Encryption
          ];

          shellHook = ''
            echo "Ansible development environment loaded"
            echo ""
            echo "Ansible Tools:"
            echo "  ansible          - $(ansible --version | head -n1)"
            echo "  ansible-playbook - Run playbooks"
            echo "  ansible-galaxy   - Manage roles and collections"
            echo "  ansible-vault    - Encrypt/decrypt secrets"
            echo "  ansible-lint     - Lint playbooks and roles"
            echo ""
            echo "Testing:"
            echo "  molecule         - Test Ansible roles"
            echo "  pytest           - Run Python tests"
            echo "  pytest-testinfra - Infrastructure testing (via pytest)"
            echo ""
            echo "Cloud CLIs:"
            echo "  aws              - AWS CLI v2"
            echo "  gcloud           - Google Cloud SDK"
            echo "  az               - Azure CLI"
            echo ""
            echo "Utilities:"
            echo "  yamllint         - YAML linter"
            echo "  jq               - JSON processor"
            echo "  yq               - YAML processor"
            echo ""
            echo "Common Workflow Commands:"
            echo "  ansible-playbook -i inventory.yml playbook.yml          - Run playbook"
            echo "  ansible-playbook -i inventory.yml playbook.yml --check  - Dry run"
            echo "  ansible-lint playbook.yml                               - Lint playbook"
            echo "  ansible-vault create secrets.yml                        - Create encrypted file"
            echo "  ansible-galaxy init role_name                           - Create new role"
            echo "  molecule init role -r role_name                         - Create role with tests"
            echo "  molecule test                                           - Run molecule tests"
          '';
        };
      }
    );
}
