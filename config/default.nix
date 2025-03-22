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
  ];

  plugins = {
    lualine.enable = true;
    gitsigns.enable = true;
    wakatime.enable = true;
    yazi.enable = true;
    web-devicons.enable = true;
    which-key.enable = true;
    nvim-autopairs.enable = true;
    markdown-preview.enable = true;
  };
}
