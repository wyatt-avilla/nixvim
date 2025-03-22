{
  # Import all your configuration modules here
  imports = [
    ./options.nix
    ./keymaps.nix
    ./telescope.nix
    ./lsp.nix
    ./cmp.nix
    ./lint.nix
    ./format.nix
  ];

  plugins = {
    lualine.enable = true;
    gitsigns.enable = true;
    wakatime.enable = true;
    yazi.enable = true;
    web-devicons.enable = true;
  };
}
