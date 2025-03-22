{
  plugins.treesitter = {
    enable = true;

    settings = {
      highlight.enable = true;
      indent.enable = true;

      ensure_installed = [
        "c"
        "markdown"
        "markdown_inline"
        "latex"
        "python"
        "bash"
        "nix"
        "vim"
        "vimdoc"
        "query"
        "rust"
        "toml"
        "regex"
      ];
    };
  };
}
