{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    {
      nixvim,
      nixpkgs,
      flake-parts,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { system, ... }:
        let
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          pkgs = import nixpkgs { inherit system; };

          bundledModule = {
            module = {
              extraPackages = with pkgs; [
                cargo
                rustc
                rustfmt
                rust-analyzer
                clippy
                ruff
                mypy
                shellcheck
                shfmt
                clang-tools
                statix
                markdownlint-cli
                nodePackages.prettier
                nixfmt-rfc-style
                yazi
                wakatime-cli
              ];
              imports = [ ./config ];
            };
          };

          minimalModule = {
            module.imports = [ ./config ];
          };
        in
        {
          checks = {
            default = nixvimLib.check.mkTestDerivationFromNixvimModule minimalModule;
          };

          packages = {
            default = nixvim'.makeNixvimWithModule bundledModule;
            nvim-minimal = nixvim'.makeNixvimWithModule minimalModule;
          };
        };
    };
}
