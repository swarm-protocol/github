# APT Package Lists for GitHub Copilot Agents

This directory contains APT package lists for setting up development environments on Debian/Ubuntu systems that correspond to each GitHub Copilot agent type. These package lists mirror the Nix environments in the `nix/` directory but use APT packages instead.

## Overview

Each subdirectory contains a `packages.txt` file listing packages available through APT that can be installed to set up an environment for a specific agent type.

##  Available Environments

| Environment | Description | Packages File |
|------------|-------------|---------------|
| **common** | Common development tools (git, vim, pandoc, etc.) | [`common/packages.txt`](common/packages.txt) |
| **test** | Multi-language testing frameworks | [`test/packages.txt`](test/packages.txt) |
| **docker** | Docker, Kubernetes, and container tools | [`docker/packages.txt`](docker/packages.txt) |
| **documentation** | Documentation generators and markdown tools | [`documentation/packages.txt`](documentation/packages.txt) |
| **refactoring** | Code refactoring and transformation tools | [`refactoring/packages.txt`](refactoring/packages.txt) |
| **code-review** | Linters and code review tools | [`code-review/packages.txt`](code-review/packages.txt) |
| **wrangler** | Cloudflare Workers development tools | [`wrangler/packages.txt`](wrangler/packages.txt) |
| **terraform** | Infrastructure as Code tools | [`terraform/packages.txt`](terraform/packages.txt) |
| **ansible** | Ansible automation and configuration management | [`ansible/packages.txt`](ansible/packages.txt) |

## Quick Start

### Install All Packages from an Environment

```bash
# Navigate to the repository root
cd /path/to/repository

# Install common development tools
sudo apt update
sudo apt install -y $(cat apt/common/packages.txt | grep -v '^#' | tr '\n' ' ')

# Install test environment packages
sudo apt install -y $(cat apt/test/packages.txt | grep -v '^#' | tr '\n' ' ')

# Install docker environment packages
sudo apt install -y $(cat apt/docker/packages.txt | grep -v '^#' | tr '\n' ' ')
```

### Install Packages from Multiple Environments

```bash
# Install common + test + docker packages
cat apt/common/packages.txt apt/test/packages.txt apt/docker/packages.txt \
  | grep -v '^#' | sort -u \
  | xargs sudo apt install -y
```

##  Package Format

Each `packages.txt` file:
- Lists one package per line
- Uses `#` for comments
- Includes installation notes for packages not available in standard repositories
- Groups related packages together

Example:
```txt
# Version control
git
gh

# Text editors
vim
nano

# Note: Some tools require additional installation steps
```

##  Important Notes

### Not All Tools Available via APT

Many specialized development tools are not available in standard APT repositories. For these tools, the `packages.txt` files include notes about alternative installation methods:

- **Language-specific tools**: Use npm, pip, cargo, go install, etc.
- **HashiCorp tools**: Require HashiCorp's official repositories (Terraform, Vault, Packer)
- **Cloud CLIs**: AWS, Azure, and GCP CLIs have their own installation methods
- **Modern CLI tools**: Many Rust/Go tools need manual download or alternative package managers

### Additional Setup Required

Some environments require additional setup beyond APT packages:

1. **Docker**: Requires Docker's official repository for latest versions
2. **Rust**: Best installed via [rustup](https://rustup.rs/) rather than APT
3. **Node.js**: Consider using [nvm](https://github.com/nvm-sh/nvm) for version management
4. **Python packages**: Use `pip3 install` for Python tools
5. **Go tools**: Use `go install` for Go packages

### Debian vs Ubuntu

Package names and availability may differ slightly between Debian and Ubuntu. These lists are optimized for Ubuntu LTS versions but should work on Debian with minor adjustments.

## Advanced Usage

### Create a Setup Script

```bash
#!/bin/bash
# setup-environment.sh

set -e

ENVIRONMENT=${1:-common}

if [ ! -f "apt/$ENVIRONMENT/packages.txt" ]; then
  echo "Error: Environment '$ENVIRONMENT' not found"
  exit 1
fi

echo "Installing packages for $ENVIRONMENT environment..."
sudo apt update
sudo apt install -y $(cat apt/$ENVIRONMENT/packages.txt | grep -v '^#' | tr '\n' ' ')

echo "Installation complete!"
```

Usage:
```bash
chmod +x setup-environment.sh
./setup-environment.sh test
./setup-environment.sh docker
```

### Docker Container Setup

Use these package lists to create Dockerfiles:

```dockerfile
FROM ubuntu:22.04

# Copy package list
COPY apt/test/packages.txt /tmp/packages.txt

# Install packages
RUN apt-get update && \
    apt-get install -y $(cat /tmp/packages.txt | grep -v '^#' | tr '\n' ' ') && \
    rm -rf /var/lib/apt/lists/*
```

### GitHub Actions

Use in CI/CD workflows:

```yaml
- name: Install development tools
  run: |
    sudo apt-get update
    sudo apt-get install -y $(cat apt/test/packages.txt | grep -v '^#' | tr '\n' ' ')
```

##  APT vs Nix

### When to Use APT

- Running on Debian/Ubuntu systems
- Prefer system package manager
- Need stable, tested package versions
- Working in traditional server environments
- Using Docker containers based on Debian/Ubuntu

### When to Use Nix

- Need reproducible, declarative environments
- Want isolated, conflict-free package installations
- Working across different Linux distributions
- Need specific package versions not in APT
- Prefer functional package management

### Comparison

| Feature | APT | Nix |
|---------|-----|-----|
| **Reproducibility** | Limited | Excellent |
| **Isolation** | System-wide | Per-environment |
| **Rollback** | Limited | Full support |
| **Setup complexity** | Low | Medium |
| **Package availability** | Moderate | Excellent |
| **Cross-platform** | Debian/Ubuntu only | Most Linux + macOS |

## Additional Resources

- [Nix environments](../nix/) - Declarative, reproducible alternatives
- [GitHub Copilot Agents](../.github/agents/) - Agent templates
- [Terraform templates](../terraform/) - Infrastructure as Code
- [Main README](../README.md) - Project overview

## Contributing

To add or update packages:

1. Edit the appropriate `packages.txt` file
2. One package per line
3. Add comments explaining non-obvious choices
4. Include installation notes for non-APT packages
5. Test on Ubuntu LTS before committing

## License

This project is part of the GitHub Copilot Agents Templates repository.

---

**Note**: These package lists are maintained to mirror the Nix environments but cannot achieve the same level of reproducibility. For truly reproducible environments, consider using the [Nix configurations](../nix/).
