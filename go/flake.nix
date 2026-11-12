{
  description = "Golang Development Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;

      config.allowUnfree = false;
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        go_1_27
        air
        golangci-lint
      ];

      shellHook = ''
        echo "🚀 Environment active"

        echo "Golang: $(go version)"
      '';
    };
  };
}
