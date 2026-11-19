{
  description = "Vite Development Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;

      config.allowUnfree = false;
    };

    nodeVersion = pkgs.lib.strings.trim (builtins.readFile ./.nvmrc);
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        pkgs."nodejs_${nodeVersion}"
        pnpm_12
      ];

      shellHook = ''
        echo "🚀 Environment active"

        echo "Vite: $(go version)"
      '';
    };
  };
}
