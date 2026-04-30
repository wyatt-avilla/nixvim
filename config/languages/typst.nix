{ pkgs, ... }:
{
  plugins = {
    treesitter.settings.grammarPackages = [ pkgs.vimPlugins.nvim-treesitter.builtGrammars.typst ];

    conform-nvim.settings.formatters_by_ft.typst.lsp_format = "prefer";

    lsp.servers.tinymist = {
      enable = true;

      settings = {
        formatterMode = "typstyle";
      };
    };
  };
}
