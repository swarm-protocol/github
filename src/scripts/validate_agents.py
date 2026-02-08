#!/usr/bin/env python3
import os
import re
import sys

def validate_agent_file(filepath):
    """
    Validates a single .agent.md file.
    Checks for:
    - Existence of YAML front matter
    - YAML front matter not being commented out
    - Presence of 'name' and 'description' fields
    """
    with open(filepath, 'r') as f:
        content = f.read()

    # Special case: TEMPLATE.agent.md is allowed to have commented out YAML
    if os.path.basename(filepath) == "TEMPLATE.agent.md":
        return True, "Skipping template file"

    # Check for commented out YAML
    # This matches <!-- followed by whitespace and then ---
    if re.search(r'<!--[\s\S]*?---', content):
         # If the FIRST occurrence of --- is after <!--, it might be commented out
         # But it's better to check if it's wrapped in <!-- -->
         comment_match = re.search(r'<!--([\s\S]*?)-->', content)
         if comment_match and '---' in comment_match.group(1):
             return False, "YAML front matter seems to be commented out"

    # Extract YAML front matter (must start at beginning of file or after optional whitespace/comments)
    # Most agents start with ---
    match = re.search(r'^---\s*\n([\s\S]*?)\n---', content, re.MULTILINE)
    if not match:
        return False, "No valid YAML front matter found at the start of the file"

    yaml_content = match.group(1)

    # Check for name and description
    # We use basic string searching to avoid needing PyYAML
    has_name = False
    has_description = False

    for line in yaml_content.split('\n'):
        line = line.strip()
        if line.startswith('name:'):
            has_name = True
        elif line.startswith('description:'):
            has_description = True

    if not has_name:
        return False, "Missing 'name' field in YAML front matter"
    if not has_description:
        return False, "Missing 'description' field in YAML front matter"

    return True, "Valid"

def main():
    agents_dir = ".github/agents"

    if not os.path.isdir(agents_dir):
        print(f"Directory {agents_dir} not found.")
        sys.exit(0) # Not an error if dir doesn't exist (e.g. in other repos)

    errors = []
    agent_files = [f for f in os.listdir(agents_dir) if f.endswith(".agent.md")]

    if not agent_files:
        print("No agent files found.")
        sys.exit(0)

    for filename in agent_files:
        filepath = os.path.join(agents_dir, filename)
        valid, message = validate_agent_file(filepath)
        if not valid:
            errors.append(f"{filename}: {message}")

    if errors:
        print(f"Found {len(errors)} validation error(s):")
        for error in errors:
            print(f"  - {error}")
        sys.exit(1)
    else:
        print(f"Successfully validated {len(agent_files)} agent(s).")
        sys.exit(0)

if __name__ == "__main__":
    main()
