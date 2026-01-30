{
  description = "Test Specialist Agent - Testing environment with various test frameworks";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # JavaScript/TypeScript testing
            nodejs_20
            nodePackages.npm
            nodePackages.jest
            nodePackages.mocha
            nodePackages.typescript

            # Python testing
            python311
            python311Packages.pytest
            python311Packages.pytest-cov
            python311Packages.pytest-mock
            python311Packages.coverage

            # Go testing
            go_1_21
            gotools

            # Rust testing
            rustc
            cargo

            # Java testing
            jdk21
            maven
            gradle

            # Code coverage tools
            lcov

            # General testing tools
            git
            gnumake
          ];

          shellHook = ''
            echo "Test Specialist environment loaded"
            echo "Available: Node.js, Python, Go, Rust, Java"
            echo "Testing frameworks: Jest, pytest, go test, cargo test, JUnit"
            echo ""
            echo "Commands available:"
            echo "  npm test       - Run JavaScript/TypeScript tests"
            echo "  pytest         - Run Python tests"
            echo "  go test        - Run Go tests"
            echo "  cargo test     - Run Rust tests"
            echo "  mvn test       - Run Java tests (Maven)"
            echo "  gradle test    - Run Java tests (Gradle)"
          '';
        };
      }
    );
}
