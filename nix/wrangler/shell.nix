{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Node.js and package managers
    nodejs_20
    nodePackages.npm
    nodePackages.yarn
    nodePackages.pnpm

    # Cloudflare Wrangler CLI
    wrangler

    # TypeScript and build tools
    nodePackages.typescript
    nodePackages.ts-node
    esbuild

    # Testing frameworks
    nodePackages.vitest
    nodePackages.jest

    # Code quality
    nodePackages.eslint
    nodePackages.prettier

    # Database tools for D1 and KV
    sqlite
    redis

    # API testing
    curl
    httpie
    jq

    # Git and version control
    git
    gh

    # Utilities
    ripgrep
    fd
    fzf
    watch
  ];

  shellHook = ''
    echo "Wrangler development environment loaded"
    echo ""
    echo "Cloudflare Workers tools:"
    echo "  wrangler       - Cloudflare Workers CLI"
    echo "  npm/yarn/pnpm  - Package managers"
    echo ""
    echo "Development tools:"
    echo "  node           - Node.js $(node --version)"
    echo "  typescript     - TypeScript compiler"
    echo "  esbuild        - Fast JavaScript bundler"
    echo ""
    echo "Testing:"
    echo "  vitest         - Unit testing framework"
    echo "  jest           - JavaScript testing"
    echo ""
    echo "Database tools:"
    echo "  sqlite         - For D1 local development"
    echo "  redis          - For KV testing"
    echo ""
    echo "API testing:"
    echo "  curl           - Command-line HTTP client"
    echo "  httpie         - User-friendly HTTP client"
    echo "  jq             - JSON processor"
    echo ""
    echo "Quick commands:"
    echo "  wrangler dev       - Start local development server"
    echo "  wrangler deploy    - Deploy to Cloudflare"
    echo "  wrangler tail      - Stream logs"
    echo "  wrangler d1        - D1 database commands"
    echo "  wrangler kv        - KV namespace commands"
  '';
}
