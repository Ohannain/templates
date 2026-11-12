{
  description = "Rust Development Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    rust-overlay,
    ...
  }: let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      overlays = [(import rust-overlay)];

      config.allowUnfree = false;
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        (rust-bin.fromRustupToolchainFile ./rust-toolchain.toml)
      ];

      shellHook = ''
        echo "🚀 Environment active"

        echo "Rust: $(rustc --version)"
        echo "Cargo: $(cargo --version)"
      '';
    };
  };
}
