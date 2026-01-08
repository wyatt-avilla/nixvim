{ pkgs, ... }:
{
  imports = [
    ./python.nix
    ./rust.nix
    ./c.nix
    ./bash.nix
    ./nix.nix
    ./latex.nix
    ./markdown.nix
    ./sql.nix
    ./yaml.nix
  ];

  plugins.treesitter = {
    enable = true;

    settings = {
      highlight.enable = true;
      indent.enable = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        vim
        vimdoc
        query
        regex
      ];
    };
  };
}
