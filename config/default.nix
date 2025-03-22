{
  # Import all your configuration modules here
  imports = [
    ./keymaps.nix
    ./bufferline.nix
  ];

  plugins = {
    lualine.enable = true;
    gitsigns.enable = true;
    wakatime.enable = true;
  };
}
