{ pkgs, ... }:
{
  plugins = {
    treesitter.settings.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      markdown
      markdown_inline
    ];

    conform-nvim.settings = {
      formatters_by_ft.markdown = [
        "prettier"
        "markdownlint"
      ];
    };

    lint.lintersByFt.markdown = [ "markdownlint" ];

    lsp.servers.marksman.enable = true;
  };
}
