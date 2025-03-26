{
  # Import all your configuration modules here
  imports = [
    ./options.nix
    ./keymaps.nix
    ./telescope.nix
    ./lsp.nix
    ./cmp.nix
    ./treesitter.nix
    ./lint.nix
    ./format.nix
    ./gitsigns.nix
  ];

  colorschemes.onedark = {
    enable = true;
    settings.style = "warmer";
  };

  plugins = {
    lualine.enable = true;
    wakatime.enable = true;
    yazi.enable = true;
    web-devicons.enable = true;
    which-key.enable = true;
    nvim-autopairs.enable = true;
    markdown-preview.enable = true;
    colorizer.enable = true;
  };
}
