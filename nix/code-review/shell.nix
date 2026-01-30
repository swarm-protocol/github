{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Multi-language linters
    shellcheck  # Shell script linter
    yamllint    # YAML linter
    nodePackages.jsonlint  # JSON linter

    # JavaScript/TypeScript
    nodejs_20
    nodePackages.eslint
    nodePackages.typescript
    nodePackages.prettier

    # Python
    python311
    python311Packages.pylint
    python311Packages.flake8
    python311Packages.black
    python311Packages.mypy
    ruff  # Fast Python linter

    # Go
    go_1_21
    golangci-lint
    gotools

    # Rust
    rustc
    cargo
    clippy
    rustfmt

    # Java
    jdk21
    checkstyle

    # C/C++
    clang-tools
    cppcheck

    # Security scanners
    trivy
    semgrep

    # Code complexity analysis
    tokei  # Code statistics
    scc    # Source lines of code counter

    # Version control
    git
    gh
    git-lfs

    # Diff tools
    diff-so-fancy
    delta

    # General utilities
    jq
    ripgrep
    fd
  ];

  shellHook = ''
    echo "Code Review environment loaded"
    echo ""
    echo "Linters by language:"
    echo "  JavaScript/TS: eslint, prettier"
    echo "  Python:        pylint, flake8, black, ruff"
    echo "  Go:            golangci-lint"
    echo "  Rust:          clippy, rustfmt"
    echo "  Java:          checkstyle"
    echo "  C/C++:         clang-tidy, cppcheck"
    echo "  Shell:         shellcheck"
    echo "  YAML:          yamllint"
    echo ""
    echo "Security tools:"
    echo "  trivy          - Vulnerability scanner"
    echo "  semgrep        - Static analysis tool"
    echo ""
    echo "Code analysis:"
    echo "  tokei          - Code statistics"
    echo "  scc            - Source lines counter"
  '';
}
