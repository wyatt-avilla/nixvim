{ pkgs, ... }:
{
  plugins = {
    treesitter.settings.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      go
      gomod
      gosum
      gowork
    ];

    lint.lintersByFt.go = [ "golangcilint" ];

    lsp.servers.gopls.enable = true;
  };
}
