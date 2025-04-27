{
  plugins.yazi = {
    enable = true;
    settings = {
      open_for_directories = true;
    };
  };

  keymaps = [
    {
      key = "<leader>lf";
      action = "<cmd>Yazi<CR>";
      mode = "n";
      options.desc = "Open Yazi";
    }
  ];
}
