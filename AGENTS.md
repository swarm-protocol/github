# AGENTS.md - Repository Navigation & Command Reference

> 🤖 **For GitHub Copilot & AI Assistants**: This file serves as a comprehensive sitemap of all documentation in this repository. Read this file to understand the complete structure and then navigate to specific READMEs as needed for detailed context.

---

## 📋 Purpose

This file helps GitHub Copilot, Cursor, and other AI assistants to:
1. **Navigate** the entire repository structure efficiently
2. **Understand** the purpose of each directory and file
3. **Execute** common development commands and workflows
4. **Reference** all available documentation quickly

---

## 🗺️ Documentation Sitemap

### Root Level Documentation

| File | Purpose | Key Topics |
|------|---------|------------|
| [README.md](README.md) | Main repository overview | Project intro, quick start, features |
| [QUICKSTART.md](QUICKSTART.md) | Fast onboarding guide | Installation, first steps, examples |
| [CONTRIBUTING.md](CONTRIBUTING.md) | Contribution guidelines | How to contribute, PR process, standards |
| [CLAUDE.md](CLAUDE.md) | Claude AI context file | Architecture, components, development workflow |
| [CURSOR.md](CURSOR.md) | Cursor agent documentation | Rules, skills, subagents, MCP integration |
| [DOCUMENTATION-BUILDER-USAGE.md](DOCUMENTATION-BUILDER-USAGE.md) | Template system guide | Variable substitution, examples |
| **[AGENTS.md](AGENTS.md)** | **This file** | **Navigation hub, bash commands** |

### GitHub Copilot Agents (`.github/agents/`)

**Main Index**: [.github/agents/README.md](.github/agents/README.md)

All agent files are in `.github/agents/` directory:

| Agent | File | Specialization |
|-------|------|----------------|
| Template | `TEMPLATE.agent.md` | Base template for creating new agents |
| Test Specialist | `test-specialist.agent.md` | Test coverage, TDD, quality assurance |
| Documentation Expert | `documentation-expert.agent.md` | READMEs, guides, API docs |
| Documentation Builder | `documentation-builder.agent.md` | Generate docs from templates |
| Code Reviewer | `code-reviewer.agent.md` | Security, performance, best practices |
| Refactoring Assistant | `refactoring-assistant.agent.md` | Safe code refactoring patterns |
| Docker Specialist | `docker-specialist.agent.md` | Dockerfiles, compose, Kubernetes |

**Invoke agents**: `@agent-name` in GitHub Copilot Chat

### Development Environments

#### Nix Flakes (`nix/`)

**Main Guide**: [nix/README.md](nix/README.md) - Comprehensive Nix setup documentation

| Environment | Location | Purpose |
|-------------|----------|---------|
| Common | `nix/common/` | Shared development tools |
| Test | `nix/test/` | Testing frameworks and tools |
| Docker | `nix/docker/` | Container development tools |
| Documentation | `nix/documentation/` | Doc generation tools |
| Code Review | `nix/code-review/` | Linters, formatters, analyzers |
| Refactoring | `nix/refactoring/` | Code transformation tools |
| Wrangler | `nix/wrangler/` | CloudFlare Workers development |
| Terraform | `nix/terraform/` | Infrastructure as Code tools |

#### APT Packages (`apt/`)

**Main Guide**: [apt/README.md](apt/README.md) - Ubuntu/Debian package lists

| Environment | Location | Purpose |
|-------------|----------|---------|
| Common | `apt/common/packages.txt` | Core development packages |
| Test | `apt/test/packages.txt` | Testing packages |
| Docker | `apt/docker/packages.txt` | Docker and container packages |
| Documentation | `apt/documentation/packages.txt` | Documentation tools |
| Code Review | `apt/code-review/packages.txt` | Code quality packages |
| Refactoring | `apt/refactoring/packages.txt` | Refactoring tool packages |
| Wrangler | `apt/wrangler/packages.txt` | CloudFlare tools |
| Terraform | `apt/terraform/packages.txt` | IaC packages |

### Infrastructure (`terraform/`)

**Main Guide**: [terraform/README.md](terraform/README.md) - CloudFlare infrastructure setup

| Module | Location | Purpose |
|--------|----------|---------|
| Workers | `terraform/modules/workers/` | CloudFlare Workers |
| Pages | `terraform/modules/pages/` | CloudFlare Pages |
| DNS | `terraform/modules/dns/` | DNS records and zones |
| Examples | `terraform/examples/` | Example configurations |

### Documentation (`docs/`)

**Main Index**: [docs/README.md](docs/README.md)

| Section | Location | Purpose |
|---------|----------|---------|
| API | `docs/api/` | API documentation |
| Guides | `docs/guides/` | How-to guides and tutorials |
| Reference | `docs/reference/` | Technical reference materials |
| Agent Prompts | `docs/AGENT_PROMPTS.md` | Instructions for documentation agents |

### Data (`data/`)

**Main Index**: [data/README.md](data/README.md)

| Section | Location | Purpose |
|---------|----------|---------|
| Schemas | `data/schemas/` | JSON schemas, data models |
| Configs | `data/configs/` | Configuration files and templates |
| Examples | `data/examples/` | Example data files |
| Agent Prompts | `data/AGENT_PROMPTS.md` | Instructions for data agents |

### Source Code (`src/`)

**Main Index**: [src/README.md](src/README.md)

| Section | Location | Purpose |
|---------|----------|---------|
| Agents | `src/agents/` | Agent implementation code |
| Utils | `src/utils/` | Utility functions and helpers |
| Scripts | `src/scripts/` | Automation scripts |
| Agent Prompts | `src/AGENT_PROMPTS.md` | Instructions for code agents |

---

## 🔧 Common Bash Commands

### Environment Setup

#### Nix (Recommended for Reproducibility)

```bash
# Install Nix (if not already installed)
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# Enter a specific environment
cd nix/docker && nix develop
cd nix/test && nix develop
cd nix/terraform && nix develop

# Exit environment
exit

# Update flake inputs
nix flake update

# Check flake status
nix flake check
```

#### APT (Ubuntu/Debian)

```bash
# Install packages from a specific environment
xargs -a apt/common/packages.txt sudo apt install -y
xargs -a apt/docker/packages.txt sudo apt install -y
xargs -a apt/terraform/packages.txt sudo apt install -y

# Update package lists
sudo apt update

# Upgrade all packages
sudo apt upgrade -y
```

### Git Workflows

```bash
# Check repository status
git status

# View recent commits
git log --oneline -10

# Create a new branch
git checkout -b feature/my-feature

# Stage all changes
git add .

# Commit with message
git commit -m "feat: add new feature"

# Push to remote
git push origin feature/my-feature

# Pull latest changes
git pull origin main

# View diff of uncommitted changes
git diff

# View diff of staged changes
git diff --cached
```

### Docker Operations

```bash
# Build a Docker image
docker build -t myapp:latest .

# Run a container
docker run -d -p 8080:80 myapp:latest

# View running containers
docker ps

# View all containers
docker ps -a

# Stop a container
docker stop <container-id>

# Remove a container
docker rm <container-id>

# View logs
docker logs <container-id>

# Execute command in running container
docker exec -it <container-id> /bin/bash

# Docker Compose operations
docker-compose up -d
docker-compose down
docker-compose logs -f
```

### Terraform Operations

```bash
# Navigate to terraform directory
cd terraform

# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# Plan changes
terraform plan

# Apply changes
terraform apply

# Destroy resources
terraform destroy

# Format files
terraform fmt -recursive

# Show state
terraform show

# List resources
terraform state list

# Workspace operations
terraform workspace list
terraform workspace new development
terraform workspace select production
```

### Testing Commands

```bash
# Run all tests (adjust based on your test framework)
npm test                    # Node.js
pytest                      # Python
go test ./...              # Go
cargo test                 # Rust
mvn test                   # Java/Maven
dotnet test                # .NET

# Run specific test file
npm test path/to/test.js
pytest tests/test_file.py
go test ./pkg/specific/

# Run with coverage
npm test -- --coverage
pytest --cov=src
go test -cover ./...

# Watch mode
npm test -- --watch
pytest-watch
```

### Documentation Generation

```bash
# Generate documentation from templates
# Using documentation-builder agent
@documentation-builder generate README.md from template

# Manual markdown linting
markdownlint **/*.md

# Generate API docs (adjust for your language)
jsdoc src/**/*.js -d docs/api/         # JavaScript
sphinx-build -b html docs/ docs/_build # Python
godoc -http=:6060                      # Go
cargo doc --open                       # Rust
```

### Code Quality

```bash
# Linting
eslint src/                 # JavaScript
pylint src/                # Python
golangci-lint run          # Go
cargo clippy               # Rust

# Formatting
prettier --write "**/*.{js,jsx,ts,tsx,json,css,md}"  # JavaScript/TypeScript
black src/                                           # Python
gofmt -w .                                          # Go
cargo fmt                                           # Rust

# Type checking
tsc --noEmit               # TypeScript
mypy src/                  # Python
```

### CloudFlare Operations

```bash
# Wrangler (CloudFlare Workers)
cd my-worker
wrangler dev               # Local development
wrangler publish           # Deploy to production
wrangler tail              # Stream logs
wrangler kv:namespace:list # List KV namespaces
wrangler secret put API_KEY # Set secret

# CloudFlare CLI
cloudflare dns list
cloudflare pages list
cloudflare workers list
```

### Search & Navigation

```bash
# Find files by name
find . -name "*.md"
find . -type f -name "README.md"

# Search file contents
grep -r "pattern" .
grep -r "TODO" --include="*.js"

# Count lines of code
find . -name "*.js" | xargs wc -l
cloc .                     # If cloc is installed

# List directory tree
tree -L 3                  # Show 3 levels deep
tree -I 'node_modules|.git' # Ignore directories
```

### File Operations

```bash
# Copy with structure
cp -r source/ destination/

# Move/rename
mv old-name new-name

# Create directory with parents
mkdir -p path/to/nested/dir

# Remove directory recursively
rm -rf directory/

# Create empty file
touch newfile.txt

# View file content
cat file.txt
less file.txt
head -n 20 file.txt
tail -f logfile.txt        # Follow file updates
```

### Process Management

```bash
# View running processes
ps aux | grep node
ps aux | grep python

# Kill process by PID
kill <pid>
kill -9 <pid>              # Force kill

# Kill process by name
pkill node
killall python

# View port usage
lsof -i :8080
netstat -tulpn | grep :8080
```

### System Information

```bash
# Disk usage
df -h
du -sh *
du -h --max-depth=1

# Memory usage
free -h
top
htop                       # If installed

# System info
uname -a
lsb_release -a            # Ubuntu/Debian
cat /etc/os-release

# Check environment variables
env
echo $PATH
```

---

## 🚀 Getting Started Quick Commands

```bash
# 1. Clone repository (if not already cloned)
git clone https://github.com/swarm-protocol/github.git
cd github

# 2. Run automated setup (RECOMMENDED)
./bootstrap.sh

# The bootstrap script will:
# - Detect your system (Nix or APT)
# - Guide you through environment selection
# - Install required dependencies
# - Verify your setup
# - Show next steps

# 3. Manual environment setup (if preferred)
# Option A: Nix (reproducible)
cd nix/common && nix develop

# Option B: APT (Ubuntu/Debian)
xargs -a apt/common/packages.txt sudo apt install -y

# 4. Explore the repository
cat AGENTS.md
cat README.md
ls -la

# 5. Start working with an agent
# In GitHub Copilot:
@test-specialist help me write tests
@docker-specialist create a Dockerfile
@documentation-builder generate README.md
```

---

## 🎯 Quick Navigation Shortcuts

### For GitHub Copilot

When you need to understand a specific area, reference these files:

```
"Read .github/agents/README.md for agent documentation"
"Read nix/README.md for development environment setup"
"Read terraform/README.md for infrastructure configuration"
"Read docs/README.md for documentation structure"
"Read src/README.md for source code organization"
```

### Command Templates

Common command patterns to use:

```bash
# Setup new environment
"Enter nix/[environment] and run nix develop"

# Install packages
"Install packages from apt/[environment]/packages.txt"

# Deploy infrastructure
"Navigate to terraform/ and run terraform apply"

# Run tests
"Execute tests in src/ directory"

# Generate documentation
"Use @documentation-builder to generate docs"
```

---

## 🔍 How to Use This File

### For GitHub Copilot

1. **Understanding Structure**: Read this entire file first to understand the repository layout
2. **Specific Questions**: Reference specific README files listed in the sitemap
3. **Command Help**: Use the bash command reference for common operations
4. **Agent Invocation**: Use `@agent-name` to invoke specialized agents

### For Developers

1. **Quick Reference**: Bookmark this file for fast navigation
2. **Command Lookup**: Search this file for bash commands you need
3. **Documentation Map**: Use sitemap to find specific documentation
4. **Onboarding**: Share this file with new team members

### For AI Assistants

1. **Context Loading**: Read this file at the start of each session
2. **Navigation**: Use the sitemap to locate relevant documentation
3. **Command Execution**: Reference bash commands for development tasks
4. **Documentation**: Check README files before asking questions

---

## 📚 Related Files

- **[README.md](README.md)**: Main project documentation
- **[QUICKSTART.md](QUICKSTART.md)**: Get started quickly
- **[CLAUDE.md](CLAUDE.md)**: Claude AI context
- **[CURSOR.md](CURSOR.md)**: Cursor IDE integration
- **[CONTRIBUTING.md](CONTRIBUTING.md)**: How to contribute

---

## 🚀 Getting Started Quick Commands

```bash
# 1. Clone repository (if not already cloned)
git clone https://github.com/swarm-protocol/github.git
cd github

# 2. Choose your environment setup method
# Option A: Nix (reproducible)
cd nix/common && nix develop

# Option B: APT (Ubuntu/Debian)
xargs -a apt/common/packages.txt sudo apt install -y

# 3. Explore the repository
cat AGENTS.md
cat README.md
ls -la

# 4. Start working with an agent
# In GitHub Copilot:
@test-specialist help me write tests
@docker-specialist create a Dockerfile
@documentation-builder generate README.md
```

---

## 💡 Tips

- **Keep this file updated**: As new directories/READMEs are added, update the sitemap
- **Use as reference**: This file is designed to be comprehensive, not exhaustive
- **Command customization**: Adapt bash commands to your specific project needs
- **Agent context**: GitHub Copilot reads this file to understand repository structure

---

**Last Updated**: 2026-01-30

**Repository**: swarm-protocol/github
