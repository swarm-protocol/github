{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # JavaScript/TypeScript refactoring
    nodejs_20
    nodePackages.npm
    nodePackages.typescript
    nodePackages.prettier
    nodePackages.eslint

    # Python refactoring
    python311
    python311Packages.black
    python311Packages.isort
    python311Packages.autopep8
    python311Packages.rope  # Python refactoring library
    ruff

    # Go refactoring
    go_1_21
    gotools
    gopls  # Go language server
    gofumpt  # Stricter gofmt

    # Rust refactoring
    rustc
    cargo
    rust-analyzer
    rustfmt

    # Java refactoring
    jdk21
    maven
    gradle

    # Code transformation tools
    comby  # Code rewriting tool
    
    # AST tools
    tree-sitter

    # Testing tools (for safe refactoring)
    nodePackages.jest
    python311Packages.pytest

    # Version control
    git
    gh
    git-absorb  # Automatic fixup commits

    # Diff and merge tools
    diff-so-fancy
    delta
    meld

    # Code search and navigation
    ripgrep
    fd
    fzf

    # Utilities
    jq
    gnumake
  ];

  shellHook = ''
    echo "Refactoring Assistant environment loaded"
    echo ""
    echo "Refactoring tools by language:"
    echo "  JavaScript/TS: prettier, eslint (--fix)"
    echo "  Python:        black, isort, autopep8, rope"
    echo "  Go:            gofmt, gofumpt, goimports"
    echo "  Rust:          rustfmt, cargo fix"
    echo "  Java:          Built-in IDE refactoring"
    echo ""
    echo "Code transformation:"
    echo "  comby          - Structural code search/replace"
    echo "  tree-sitter    - AST-based operations"
    echo ""
    echo "Safety tools:"
    echo "  jest, pytest   - Run tests after refactoring"
    echo "  git            - Version control for safe iterations"
    echo ""
    echo "Navigation:"
    echo "  ripgrep (rg)   - Fast code search"
    echo "  fd             - Fast file finder"
    echo "  fzf            - Fuzzy finder"
  '';
}
