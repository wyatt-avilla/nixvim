{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";

    nix-ci = {
      url = "github:wyatt-avilla/nix-ci";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixvim,
      nixpkgs,
      flake-parts,
      nix-ci,
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
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          ci = nix-ci.lib.mkProject {
            inherit pkgs;
            src = self;
          };

          bundledModule = {
            module = {
              extraPackagesAfter = with pkgs; [
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
                prettier
                nixfmt-rfc-style
                yazi
                wakatime-cli
                texlab
                tex-fmt
                texlivePackages.chktex
                sqlfluff
                terraform
                terraform-ls
                tflint
                tinymist
              ];
              imports = [ ./config ];
            };
          };

          minimalModule = {
            module.imports = [ ./config ];
          };
        in
        {
          checks = ci.checks // {
            default = nixvimLib.check.mkTestDerivationFromNixvimModule minimalModule;
          };

          inherit (ci) formatter;

          packages = {
            default = nixvim'.makeNixvimWithModule bundledModule;
            nvim-minimal = nixvim'.makeNixvimWithModule minimalModule;
          };

          devShells = {
            default = ci.devShell;
          };
        };
    };
}
