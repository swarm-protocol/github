{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Version control
    git
    gh

    # Text editors and tools
    vim
    nano

    # Shell utilities
    coreutils
    findutils
    gnugrep
    gnused
    gawk

    # Documentation tools
    pandoc
    
    # Markdown tools
    mdl

    # YAML tools
    yq-go
    yamllint
  ];

  shellHook = ''
    echo "Common GitHub Copilot Agents development environment loaded"
    echo "Available tools: git, gh, vim, nano, pandoc, mdl, yq, yamllint"
  '';
}
