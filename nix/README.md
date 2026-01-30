# Nix Development Environments for GitHub Copilot Agents

This directory contains Nix flakes and shell configurations for development environments tailored to each GitHub Copilot agent type. Each subdirectory provides a reproducible development environment with all necessary tools and dependencies.

## Directory Structure

```
nix/
├── common/          # Common tools for all agents
├── test/            # Test Specialist agent environment
├── docker/          # Docker Specialist agent environment
├── documentation/   # Documentation agents environment
├── code-review/     # Code Review agent environment
├── refactoring/     # Refactoring Assistant agent environment
├── wrangler/        # Cloudflare Workers development environment
├── terraform/       # Infrastructure as Code environment
└── ansible/         # Ansible automation environment
```

## Prerequisites

To use these Nix environments, you need:

1. **Nix package manager** installed:
   ```bash
   curl -L https://nixos.org/nix/install | sh
   ```

2. **Enable flakes** (for flake.nix usage):
   ```bash
   mkdir -p ~/.config/nix
   echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
   ```

## Usage

### Using with Flakes (Recommended)

Enter a development environment using `nix develop`:

```bash
# Test Specialist environment
cd nix/test
nix develop

# Docker Specialist environment
cd nix/docker
nix develop

# Documentation environment
cd nix/documentation
nix develop

# Code Review environment
cd nix/code-review
nix develop

# Refactoring environment
cd nix/refactoring
nix develop

# Wrangler environment (Cloudflare Workers)
cd nix/wrangler
nix develop

# Terraform environment (Infrastructure as Code)
cd nix/terraform
nix develop

# Ansible environment (Configuration Management)
cd nix/ansible
nix develop

# Common tools only
cd nix/common
nix develop
```

### Using with Legacy nix-shell

If you prefer the traditional `nix-shell`:

```bash
# Test Specialist environment
cd nix/test
nix-shell

# Docker Specialist environment
cd nix/docker
nix-shell

# And so on...
```

### Quick Access from Repository Root

You can also enter any environment from the repository root:

```bash
# Using flakes
nix develop ./nix/test
nix develop ./nix/docker
nix develop ./nix/documentation
nix develop ./nix/code-review
nix develop ./nix/refactoring
nix develop ./nix/wrangler
nix develop ./nix/terraform
nix develop ./nix/ansible

# Using nix-shell
nix-shell ./nix/test/shell.nix
nix-shell ./nix/docker/shell.nix
nix-shell ./nix/wrangler/shell.nix
nix-shell ./nix/terraform/shell.nix
nix-shell ./nix/ansible/shell.nix
# etc...
```

## Environment Details

### Common (`nix/common/`)

**Purpose**: Basic tools shared across all agent types

**Includes**:
- Version control: git, gh
- Text editors: vim, nano
- Documentation: pandoc, mdl
- YAML tools: yq, yamllint
- Shell utilities: coreutils, findutils, grep, sed, awk

**When to use**: For general repository work or when you need basic tools without specific language support.

### Test (`nix/test/`)

**Purpose**: Comprehensive testing environment for Test Specialist agent

**Includes**:
- **JavaScript/TypeScript**: Node.js 20, npm, Jest, Mocha, TypeScript
- **Python**: Python 3.11, pytest, pytest-cov, coverage
- **Go**: Go 1.21, gotools
- **Rust**: rustc, cargo
- **Java**: JDK 21, Maven, Gradle
- **Coverage**: lcov

**When to use**: 
- Writing or running tests
- Test coverage analysis
- Multi-language testing workflows
- Working with `@test-specialist` agent

### Docker (`nix/docker/`)

**Purpose**: Container and orchestration environment for Docker Specialist agent

**Includes**:
- **Container tools**: docker, docker-compose, podman, dive
- **Kubernetes**: kubectl, helm, kustomize, k9s
- **Security**: trivy (vulnerability scanner), hadolint (Dockerfile linter)
- **YAML tools**: yq, yamllint, yamlfmt
- **Registries**: skopeo

**When to use**:
- Building Docker images
- Working with docker-compose
- Kubernetes manifest creation
- Container security scanning
- Working with `@docker-specialist` agent

### Documentation (`nix/documentation/`)

**Purpose**: Documentation writing and generation environment

**Includes**:
- **Markdown**: pandoc, mdl, markdownlint, marksman
- **Generators**: hugo, jekyll, sphinx, mkdocs
- **Diagrams**: graphviz, plantuml, mermaid
- **Quality**: aspell (spell checker)
- **Node.js**: For documentation tools

**When to use**:
- Writing documentation
- Generating static sites
- Creating diagrams
- Working with `@documentation-expert` or `@documentation-builder` agents

### Code Review (`nix/code-review/`)

**Purpose**: Multi-language code analysis and review environment

**Includes**:
- **JavaScript/TS**: eslint, prettier, TypeScript
- **Python**: pylint, flake8, black, mypy, ruff
- **Go**: golangci-lint, gotools
- **Rust**: clippy, rustfmt
- **Java**: checkstyle
- **C/C++**: clang-tools, cppcheck
- **Security**: trivy, semgrep
- **Analysis**: tokei, scc
- **Shell**: shellcheck

**When to use**:
- Code review tasks
- Static analysis
- Security scanning
- Code quality checks
- Working with `@code-reviewer` agent

### Refactoring (`nix/refactoring/`)

**Purpose**: Safe code refactoring and modernization environment

**Includes**:
- **JavaScript/TS**: prettier, eslint, TypeScript
- **Python**: black, isort, autopep8, rope, ruff
- **Go**: gofmt, gofumpt, gopls
- **Rust**: rustfmt, rust-analyzer
- **Java**: Maven, Gradle
- **Tools**: comby (code rewriting), tree-sitter
- **Testing**: jest, pytest (for validation)
- **Navigation**: ripgrep, fd, fzf
- **VCS**: git, git-absorb

**When to use**:
- Refactoring code
- Modernizing codebases
- Automated code formatting
- Structural code transformations
- Working with `@refactoring-assistant` agent

### Wrangler (`nix/wrangler/`)

**Purpose**: Cloudflare Workers development environment

**Includes**:
- **Runtime**: Node.js 20, npm, yarn, pnpm
- **Cloudflare**: wrangler CLI
- **TypeScript**: TypeScript, ts-node, esbuild
- **Testing**: vitest, jest
- **Database**: sqlite (D1), redis (KV testing)
- **API Testing**: curl, httpie, jq
- **Code Quality**: eslint, prettier

**When to use**:
- Developing Cloudflare Workers
- Working with Cloudflare D1, KV, R2, Durable Objects
- Edge computing applications
- Serverless function development
- Testing Workers locally with Miniflare

### Terraform (`nix/terraform/`)

**Purpose**: Infrastructure as Code development and management

**Includes**:
- **IaC Tools**: terraform, terragrunt, terraform-docs, terraform-ls
- **Security**: tfsec, terrascan, checkov
- **Cost**: infracost (cost estimation)
- **Cloud CLIs**: awscli2, gcloud, azure-cli
- **Kubernetes**: kubectl, helm
- **Secrets**: vault, git-crypt
- **Automation**: packer, ansible
- **Linting**: tflint
- **Utilities**: jq, yq, graphviz

**When to use**:
- Writing Terraform configurations
- Managing cloud infrastructure (AWS, GCP, Azure)
- Infrastructure security scanning
- Cost estimation and optimization
- Multi-cloud deployments
- Kubernetes infrastructure provisioning

### Ansible (`nix/ansible/`)

**Purpose**: Infrastructure automation and configuration management

**Includes**:
- **Ansible Core**: ansible, ansible-lint, ansible-language-server
- **Python**: Python 3.11, pip, jmespath, netaddr, passlib
- **Testing**: molecule, pytest, pytest-testinfra
- **Cloud CLIs**: awscli2, gcloud, azure-cli
- **Cloud SDKs**: boto3, google-api-python-client, azure-mgmt-resource
- **Container Tools**: docker, docker-compose (for Molecule)
- **YAML/JSON**: yamllint, yq, jq
- **SSH**: openssh, sshpass
- **Utilities**: pwgen, age, pre-commit

**When to use**:
- Writing Ansible playbooks and roles
- Configuration management automation
- Server provisioning and configuration
- Multi-cloud deployments with Ansible
- Testing roles with Molecule
- Working with `@ansible-specialist` agent

## Tips and Best Practices

### 1. Persistence with direnv

For automatic environment activation when entering directories, use [direnv](https://direnv.net/):

```bash
# Install direnv
nix-env -iA nixpkgs.direnv

# In each environment directory, create .envrc
echo "use flake" > nix/test/.envrc
direnv allow nix/test
```

### 2. Combining Environments

You can combine multiple environments if needed:

```bash
# Merge test and docker environments
nix develop ./nix/test --profile test-profile
nix develop ./nix/docker --profile docker-profile
```

### 3. Updating Dependencies

To update all flake inputs:

```bash
cd nix/test  # or any other directory
nix flake update
```

### 4. Garbage Collection

Nix stores can grow large. Clean up old generations:

```bash
nix-collect-garbage -d
```

### 5. Building Without Entering Shell

You can run commands directly without entering the shell:

```bash
nix develop ./nix/test --command npm test
nix develop ./nix/docker --command docker version
```

## Customization

### Adding Packages

To add packages to an environment:

1. Edit the respective `flake.nix` or `shell.nix`
2. Add the package to the `buildInputs` list
3. Update the `shellHook` if needed

Example (adding `tmux` to test environment):

```nix
buildInputs = with pkgs; [
  # ... existing packages ...
  tmux
];
```

### Creating Custom Environments

To create a new environment:

1. Create a new subdirectory: `mkdir nix/myenv`
2. Copy a template: `cp nix/common/flake.nix nix/myenv/`
3. Edit and customize the packages
4. Test: `nix develop ./nix/myenv`

## Troubleshooting

### "experimental-features" Error

If you see an error about experimental features:

```bash
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

### Slow First Build

The first time entering an environment downloads and builds packages. Subsequent entries are fast due to caching.

### Binary Cache

To speed up installations, ensure you're using the official cache:

```bash
# In /etc/nix/nix.conf or ~/.config/nix/nix.conf
substituters = https://cache.nixos.org
trusted-public-keys = cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=
```

### Package Not Found

If a package isn't found, check the [NixOS package search](https://search.nixos.org/packages).

## CI/CD Integration

These environments can be used in CI/CD pipelines:

### GitHub Actions

```yaml
- name: Setup Nix
  # Pin to specific commit SHA for security (v22 corresponds to this commit)
  uses: cachix/install-nix-action@6004951b182f8860210c8d6f0d808ec5b1a33d28
  with:
    extra_nix_config: |
      experimental-features = nix-command flakes

- name: Run tests
  run: nix develop ./nix/test --command npm test
```

### GitLab CI

```yaml
test:
  image: nixos/nix:latest
  before_script:
    - nix --version
  script:
    - nix develop ./nix/test --command pytest
```

## Resources

- [Nix Manual](https://nixos.org/manual/nix/stable/)
- [Nix Flakes](https://nixos.wiki/wiki/Flakes)
- [NixOS Package Search](https://search.nixos.org/packages)
- [Nix Pills](https://nixos.org/guides/nix-pills/)

## Contributing

When adding new environments or packages:

1. Test the environment: `nix develop --check`
2. Update this README
3. Consider cross-platform compatibility
4. Add helpful `shellHook` messages

## License

Same as the parent repository (Unlicense/Public Domain).
