{
  imports = [
    ./options.nix
    ./keymaps.nix
    ./fzf.nix
    ./lsp.nix
    ./cmp.nix
    ./treesitter.nix
    ./lint.nix
    ./format.nix
    ./gitsigns.nix
    ./lualine.nix
    ./fugitive.nix
    ./autocmd.nix
    ./yazi.nix
    ./copilot.nix
  ];

  colorschemes.onedark = {
    enable = true;
    settings.style = "warmer";
  };

  highlight.FloatBorder = {
    link = "guifg";
  };

  plugins = {
    wakatime.enable = true;
    web-devicons.enable = true;
    which-key.enable = true;
    nvim-autopairs.enable = true;
    markdown-preview.enable = true;
    colorizer.enable = true;
    vim-surround.enable = true;
  };
}
