{ pkgs, ... }:
{
  plugins = {
    treesitter.settings.grammarPackages = [ pkgs.vimPlugins.nvim-treesitter.builtGrammars.nix ];

    conform-nvim.settings = {
      formatters_by_ft.nix = [ "nixfmt" ];
      formatters.nixfmt.prepend_args = [ "--strict" ];
    };

    lint.lintersByFt.nix = [ "statix" ];

    lsp.servers.nixd.enable = true;
  };
}
