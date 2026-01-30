#!/usr/bin/env bash

###############################################################################
# Bootstrap Script for GitHub Copilot Agent Templates Repository
#
# This script helps set up your development environment by:
# - Detecting your system (Nix or APT-based)
# - Installing required dependencies
# - Verifying the setup
# - Providing guidance on next steps
###############################################################################

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
print_header() {
    echo -e "\n${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}  $1${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

# Detect OS
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if [ -f /etc/os-release ]; then
            . /etc/os-release
            OS=$ID
            OS_VERSION=$VERSION_ID
        else
            OS="unknown"
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
        OS_VERSION=$(sw_vers -productVersion)
    else
        OS="unknown"
    fi
    
    print_info "Detected OS: $OS $OS_VERSION"
}

# Check if Nix is available
check_nix() {
    if command -v nix &> /dev/null; then
        print_success "Nix is installed"
        nix --version
        return 0
    else
        print_warning "Nix is not installed"
        return 1
    fi
}

# Check if APT is available
check_apt() {
    if command -v apt &> /dev/null; then
        print_success "APT is available"
        return 0
    else
        print_warning "APT is not available"
        return 1
    fi
}

# Install Nix
install_nix() {
    print_header "Installing Nix"
    
    print_info "This will install Nix using the Determinate Systems installer"
    read -p "Continue? (y/n) " -n 1 -r
    echo
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
        
        if [ $? -eq 0 ]; then
            print_success "Nix installed successfully"
            print_info "Please restart your shell or run: source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"
            return 0
        else
            print_error "Failed to install Nix"
            return 1
        fi
    else
        print_warning "Nix installation skipped"
        return 1
    fi
}

# Setup environment using Nix
setup_nix_environment() {
    local env_type=$1
    
    print_header "Setting up Nix environment: $env_type"
    
    if [ ! -d "nix/$env_type" ]; then
        print_error "Environment type '$env_type' not found in nix/ directory"
        return 1
    fi
    
    cd "nix/$env_type"
    
    print_info "Entering Nix development shell..."
    print_info "Run 'nix develop' to activate this environment"
    print_info "Run 'exit' to leave the environment"
    
    cd ../..
    
    print_success "Nix environment setup complete"
    print_info "Navigate to nix/$env_type and run: nix develop"
}

# Setup environment using APT
setup_apt_environment() {
    local env_type=$1
    
    print_header "Setting up APT environment: $env_type"
    
    if [ ! -f "apt/$env_type/packages.txt" ]; then
        print_error "Environment type '$env_type' not found in apt/ directory"
        return 1
    fi
    
    print_info "Installing packages from apt/$env_type/packages.txt"
    print_warning "This requires sudo privileges"
    
    if xargs -a "apt/$env_type/packages.txt" sudo apt install -y; then
        print_success "Packages installed successfully"
        return 0
    else
        print_error "Failed to install some packages"
        return 1
    fi
}

# Show environment menu
show_environment_menu() {
    local setup_method=$1
    
    print_header "Choose Development Environment"
    
    echo "Available environments:"
    echo "  1) common        - Core development tools (git, editors, etc.)"
    echo "  2) test          - Testing frameworks and tools"
    echo "  3) docker        - Docker and container tools"
    echo "  4) documentation - Documentation generation tools"
    echo "  5) code-review   - Linters, formatters, analyzers"
    echo "  6) refactoring   - Code transformation tools"
    echo "  7) wrangler      - CloudFlare Workers development"
    echo "  8) terraform     - Infrastructure as Code tools"
    echo "  9) all           - Install all environments (APT only)"
    echo "  0) exit          - Exit setup"
    echo
    
    read -p "Select environment (1-9, 0 to exit): " choice
    
    case $choice in
        1) env_type="common" ;;
        2) env_type="test" ;;
        3) env_type="docker" ;;
        4) env_type="documentation" ;;
        5) env_type="code-review" ;;
        6) env_type="refactoring" ;;
        7) env_type="wrangler" ;;
        8) env_type="terraform" ;;
        9) 
            if [ "$setup_method" = "apt" ]; then
                env_type="all"
            else
                print_error "Installing all environments is only supported with APT"
                return 1
            fi
            ;;
        0) 
            print_info "Exiting setup"
            exit 0
            ;;
        *)
            print_error "Invalid choice"
            return 1
            ;;
    esac
    
    if [ "$setup_method" = "nix" ]; then
        setup_nix_environment "$env_type"
    elif [ "$setup_method" = "apt" ]; then
        if [ "$env_type" = "all" ]; then
            for env in common test docker documentation code-review refactoring wrangler terraform; do
                setup_apt_environment "$env"
            done
        else
            setup_apt_environment "$env_type"
        fi
    fi
}

# Verify setup
verify_setup() {
    print_header "Verifying Setup"
    
    local checks_passed=0
    local checks_total=0
    
    # Check git
    ((checks_total++))
    if command -v git &> /dev/null; then
        print_success "git is installed ($(git --version))"
        ((checks_passed++))
    else
        print_error "git is not installed"
    fi
    
    # Check if in git repository
    ((checks_total++))
    if git rev-parse --git-dir > /dev/null 2>&1; then
        print_success "Running in a git repository"
        ((checks_passed++))
    else
        print_warning "Not in a git repository"
    fi
    
    # Check agent files
    ((checks_total++))
    if [ -d ".github/agents" ]; then
        agent_count=$(find .github/agents -name "*.agent.md" | wc -l)
        print_success "Found $agent_count agent files in .github/agents/"
        ((checks_passed++))
    else
        print_error ".github/agents directory not found"
    fi
    
    # Check documentation
    ((checks_total++))
    if [ -f "README.md" ] && [ -f "AGENTS.md" ]; then
        print_success "Core documentation files present"
        ((checks_passed++))
    else
        print_error "Missing core documentation files"
    fi
    
    echo
    print_info "Verification complete: $checks_passed/$checks_total checks passed"
    
    if [ $checks_passed -eq $checks_total ]; then
        return 0
    else
        return 1
    fi
}

# Show next steps
show_next_steps() {
    print_header "Next Steps"
    
    echo "Your development environment is set up! Here's what you can do next:"
    echo
    echo "📖 Documentation:"
    echo "   • Read AGENTS.md for a complete sitemap and bash commands"
    echo "   • Read QUICKSTART.md for quick onboarding"
    echo "   • Read README.md for project overview"
    echo
    echo "🤖 Using GitHub Copilot Agents:"
    echo "   • Agents are in .github/agents/"
    echo "   • Invoke with @agent-name in GitHub Copilot Chat"
    echo "   • Available agents: test-specialist, documentation-expert,"
    echo "     code-reviewer, refactoring-assistant, docker-specialist,"
    echo "     documentation-builder"
    echo
    echo "🔧 Development Environments:"
    if check_nix > /dev/null 2>&1; then
        echo "   • Activate Nix environment: cd nix/<env> && nix develop"
    fi
    if check_apt > /dev/null 2>&1; then
        echo "   • Install APT packages: xargs -a apt/<env>/packages.txt sudo apt install -y"
    fi
    echo
    echo "☁️  CloudFlare Infrastructure:"
    echo "   • Review terraform/ for CloudFlare deployment templates"
    echo "   • Initialize: cd terraform && terraform init"
    echo
    echo "📝 Creating Custom Agents:"
    echo "   • Copy .github/agents/TEMPLATE.agent.md"
    echo "   • Customize for your needs"
    echo "   • Commit to .github/agents/"
    echo
}

# Main function
main() {
    print_header "GitHub Copilot Agent Templates - Bootstrap"
    
    echo "This script will help you set up your development environment."
    echo
    
    # Detect OS
    detect_os
    echo
    
    # Check for existing package managers
    local has_nix=false
    local has_apt=false
    
    if check_nix; then
        has_nix=true
    fi
    echo
    
    if check_apt; then
        has_apt=true
    fi
    echo
    
    # Determine setup method
    if [ "$has_nix" = true ]; then
        print_info "Nix is available - recommended for reproducible environments"
        read -p "Use Nix for setup? (y/n) " -n 1 -r
        echo
        
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            show_environment_menu "nix"
        elif [ "$has_apt" = true ]; then
            print_info "Falling back to APT"
            show_environment_menu "apt"
        else
            print_error "No supported package manager available"
            exit 1
        fi
    elif [ "$has_apt" = true ]; then
        print_info "Using APT for package installation"
        show_environment_menu "apt"
    else
        print_warning "Neither Nix nor APT is available"
        read -p "Would you like to install Nix? (y/n) " -n 1 -r
        echo
        
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            if install_nix; then
                print_success "Nix installed - please restart your shell and run this script again"
                exit 0
            else
                print_error "Failed to install Nix"
                exit 1
            fi
        else
            print_error "No package manager available. Please install Nix or use a Debian/Ubuntu system."
            exit 1
        fi
    fi
    
    echo
    
    # Verify setup
    if verify_setup; then
        print_success "Setup verification passed!"
    else
        print_warning "Setup verification completed with warnings"
    fi
    
    echo
    
    # Show next steps
    show_next_steps
    
    print_header "Bootstrap Complete!"
}

# Run main function
main "$@"
