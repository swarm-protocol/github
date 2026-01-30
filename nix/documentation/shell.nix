{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Markdown tools
    pandoc
    mdl  # Markdown linter
    marksman  # Markdown LSP
    nodePackages.markdownlint-cli

    # Documentation generators
    hugo
    jekyll
    sphinx
    mkdocs
    python311Packages.mkdocs-material

    # Diagram tools
    graphviz
    plantuml
    mermaid-cli

    # Text processing
    gnused
    gawk
    jq

    # Spell checking
    aspell
    aspellDicts.en

    # Version control
    git
    gh

    # Node.js for documentation tools
    nodejs_20
    nodePackages.npm

    # Utilities
    tree
    ripgrep
    fd
  ];

  shellHook = ''
    echo "Documentation environment loaded"
    echo ""
    echo "Documentation generators:"
    echo "  pandoc         - Universal document converter"
    echo "  hugo           - Static site generator"
    echo "  jekyll         - Static site generator"
    echo "  mkdocs         - Python documentation generator"
    echo "  sphinx         - Python documentation tool"
    echo ""
    echo "Markdown tools:"
    echo "  mdl            - Markdown linter"
    echo "  markdownlint   - Markdown style checker"
    echo "  marksman       - Markdown language server"
    echo ""
    echo "Diagram tools:"
    echo "  graphviz       - Graph visualization"
    echo "  plantuml       - UML diagram generator"
    echo "  mermaid        - Diagram and flowchart tool"
    echo ""
    echo "Quality tools:"
    echo "  aspell         - Spell checker"
  '';
}
