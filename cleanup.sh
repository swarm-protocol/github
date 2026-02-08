#!/usr/bin/env bash

###############################################################################
# Cleanup Script for Leftover Files
#
# PURPOSE:
#   This script's sole purpose is to delete files that are left over when a
#   new codebase is created and the resulting file structure does not match
#   the original repository's expected layout.
#
# USAGE:
#   This script is FULLY COMMENTED OUT by default. It should only be
#   uncommented and executed when explicitly prompted by an LLM or developer.
#
#   To use:
#     1. Review the EXPECTED_FILES list below and update it to match your
#        repository's canonical file structure.
#     2. Uncomment the active code sections (remove the leading '# ' from
#        each line in the "Active Code" sections).
#     3. Run the script:  bash cleanup.sh
#     4. Review the output and confirm deletions when prompted.
#     5. Re-comment the script after use to prevent accidental execution.
#
# WARNING:
#   - Always commit or back up your work BEFORE running this script.
#   - This script will permanently delete files not in the expected list.
#   - Review the dry-run output carefully before confirming deletions.
#
# SEE ALSO:
#   AGENTS.md - "Protocol: Cleanup Leftover Files" section for full protocol.
###############################################################################

###############################################################################
# CONFIGURATION
# Define the expected file structure of the original repository.
# Update this list to match your project's canonical files and directories.
#
# TIP: You can generate this list from the original repo with:
#   git ls-files | sort
# or:
#   find . -not -path './.git/*' -type f | sed 's|^\./||' | sort
###############################################################################

# EXPECTED_FILES=(
#   ".cursor/rules/code-review.md"
#   ".cursor/rules/documentation.md"
#   ".cursor/rules/general.md"
#   ".cursor/rules/testing.md"
#   ".dockerignore"
#   ".editorconfig"
#   ".github/agents/README.md"
#   ".github/agents/TEMPLATE.agent.md"
#   ".github/agents/ansible-specialist.agent.md"
#   ".github/agents/code-reviewer.agent.md"
#   ".github/agents/docker-specialist.agent.md"
#   ".github/agents/documentation-builder.agent.md"
#   ".github/agents/documentation-expert.agent.md"
#   ".github/agents/refactoring-assistant.agent.md"
#   ".github/agents/security-auditor.agent.md"
#   ".github/agents/test-specialist.agent.md"
#   ".github/workflows/security-scan.yml"
#   ".gitignore"
#   "AGENTS.md"
#   "CLAUDE.md"
#   "CURSOR.md"
#   "DOCKERFILE.template"
#   "GEMINI.md"
#   "LICENSE"
#   "N8N.md"
#   "QWEN.md"
#   "README.md"
#   "SUPABASE.md"
#   "apt/ansible/packages.txt"
#   "apt/code-review/packages.txt"
#   "apt/common/packages.txt"
#   "apt/docker/packages.txt"
#   "apt/documentation/packages.txt"
#   "apt/refactoring/packages.txt"
#   "apt/security/packages.txt"
#   "apt/terraform/packages.txt"
#   "apt/test/packages.txt"
#   "apt/wrangler/packages.txt"
#   "bootstrap.sh"
#   "cleanup.sh"
#   "data/AGENT_PROMPTS.md"
#   "docs/AGENT_PROMPTS.md"
#   "nix/ansible/flake.nix"
#   "nix/ansible/shell.nix"
#   "nix/code-review/flake.nix"
#   "nix/code-review/shell.nix"
#   "nix/common/flake.nix"
#   "nix/common/shell.nix"
#   "nix/docker/flake.nix"
#   "nix/docker/shell.nix"
#   "nix/documentation/flake.nix"
#   "nix/documentation/shell.nix"
#   "nix/refactoring/flake.nix"
#   "nix/refactoring/shell.nix"
#   "nix/security/flake.nix"
#   "nix/security/shell.nix"
#   "nix/terraform/flake.nix"
#   "nix/terraform/shell.nix"
#   "nix/test/flake.nix"
#   "nix/test/shell.nix"
#   "nix/wrangler/flake.nix"
#   "nix/wrangler/shell.nix"
#   "src/AGENT_PROMPTS.md"
#   "src/scripts/validate_agents.py"
#   "terraform/.gitignore"
#   "terraform/examples/worker.js"
#   "terraform/main.tf"
#   "terraform/modules/dns/main.tf"
#   "terraform/modules/dns/outputs.tf"
#   "terraform/modules/dns/variables.tf"
#   "terraform/modules/pages/main.tf"
#   "terraform/modules/pages/outputs.tf"
#   "terraform/modules/pages/variables.tf"
#   "terraform/modules/workers/main.tf"
#   "terraform/modules/workers/outputs.tf"
#   "terraform/modules/workers/variables.tf"
#   "terraform/outputs.tf"
#   "terraform/terraform.tfvars.example"
#   "terraform/variables.tf"
#   "terraform/versions.tf"
# )

###############################################################################
# ACTIVE CODE - UNCOMMENT BELOW TO ENABLE
# Remove the leading '# ' from each line to activate the script logic.
###############################################################################

# --- Color Definitions ---
# RED='\033[0;31m'
# GREEN='\033[0;32m'
# YELLOW='\033[1;33m'
# BLUE='\033[0;34m'
# NC='\033[0m' # No Color

# --- Safety Checks ---
# # Ensure we are at the top level of a git repository
# REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null) || {
#   echo -e "${RED}Error: Not inside a git repository.${NC}"
#   exit 1
# }
# if [ "$(pwd)" != "$REPO_ROOT" ]; then
#   echo -e "${RED}Error: Not at the repository root. Run from: $REPO_ROOT${NC}"
#   exit 1
# fi

# --- Build Lookup Set from Expected Files ---
# # Abort if EXPECTED_FILES is unset or empty to prevent accidental deletion
# if [ ${#EXPECTED_FILES[@]} -eq 0 ]; then
#   echo -e "${RED}Error: EXPECTED_FILES is empty or not uncommented.${NC}"
#   echo -e "${RED}Uncomment the EXPECTED_FILES array in this script before running.${NC}"
#   exit 1
# fi
#
# # Create an associative array for O(1) lookups of expected files
# declare -A expected_set
# for file in "${EXPECTED_FILES[@]}"; do
#   expected_set["$file"]=1
# done

# --- Discover All Current Files ---
# # Find all git-tracked and untracked (non-ignored) files
# mapfile -t current_files < <({ git ls-files; git ls-files --others --exclude-standard; } | sort -u)

# --- Identify Leftover Files ---
# # Compare current files against the expected list to find leftovers
# leftover_files=()
# for file in "${current_files[@]}"; do
#   if [[ -z "${expected_set[$file]+_}" ]]; then
#     leftover_files+=("$file")
#   fi
# done

# --- Report Results ---
# # If no leftover files are found, exit cleanly
# if [ ${#leftover_files[@]} -eq 0 ]; then
#   echo -e "${GREEN}No leftover files found. File structure matches expected layout.${NC}"
#   exit 0
# fi

# # Display the leftover files that would be deleted
# echo -e "${YELLOW}The following ${#leftover_files[@]} file(s) do not match the expected repository structure:${NC}"
# echo ""
# for file in "${leftover_files[@]}"; do
#   echo -e "  ${RED}-${NC} $file"
# done
# echo ""

# --- Dry Run / Confirmation ---
# # Prompt the user for confirmation before deleting
# echo -e "${BLUE}Would you like to delete these files? (y/N)${NC}"
# read -r confirmation
# if [[ "$confirmation" != "y" && "$confirmation" != "Y" ]]; then
#   echo -e "${YELLOW}Aborted. No files were deleted.${NC}"
#   exit 0
# fi

# --- Delete Leftover Files ---
# # Remove each leftover file and report progress
# deleted_count=0
# for file in "${leftover_files[@]}"; do
#   if rm -- "$file" 2>/dev/null; then
#     echo -e "  ${GREEN}Deleted:${NC} $file"
#     deleted_count=$((deleted_count + 1))
#   else
#     echo -e "  ${RED}Failed to delete:${NC} $file"
#   fi
# done

# --- Clean Up Empty Directories ---
# # Remove any directories that are now empty after file deletion
# find . -path './.git' -prune -o -type d -empty -delete 2>/dev/null

# --- Summary ---
# echo ""
# echo -e "${GREEN}Cleanup complete. Deleted $deleted_count of ${#leftover_files[@]} leftover file(s).${NC}"
# echo -e "${YELLOW}Tip: Run 'git status' to review the changes before committing.${NC}"
