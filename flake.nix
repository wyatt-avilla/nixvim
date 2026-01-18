{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";

    nix-checks = {
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
      nix-checks,
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
                nodePackages.prettier
                nixfmt-rfc-style
                yazi
                wakatime-cli
                texlab
                tex-fmt
                texlivePackages.chktex
                sqlfluff
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

            formatting = nix-checks.lib.mkFormattingCheck {
              inherit pkgs;
              src = self;
            };

            linting = nix-checks.lib.mkLintingCheck {
              inherit pkgs;
              src = self;
            };

            dead-code = nix-checks.lib.mkDeadCodeCheck {
              inherit pkgs;
              src = self;
            };
          };

          packages = {
            default = nixvim'.makeNixvimWithModule bundledModule;
            nvim-minimal = nixvim'.makeNixvimWithModule minimalModule;
          };

          devShells = {
            default = pkgs.mkShell {
              packages = with pkgs; [
                pre-commit
                nixfmt-rfc-style
                statix
              ];
              shellHook = ''
                pre-commit install
              '';
            };
          };
        };
    };
}
