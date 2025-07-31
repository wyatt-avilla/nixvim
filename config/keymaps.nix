{
  keymaps = [
    {
      key = ";";
      action = ":";
      mode = "n";
      options.noremap = true;
    }
    {
      key = "n";
      action = "h";
      mode = [
        "n"
        "x"
      ];
      options.noremap = true;
    }
    {
      key = "e";
      action = "j";
      mode = [
        "n"
        "x"
      ];
      options.noremap = true;
    }
    {
      key = "i";
      action = "k";
      mode = [
        "n"
        "x"
      ];
      options.noremap = true;
    }
    {
      key = "o";
      action = "l";
      mode = [
        "n"
        "x"
      ];
      options.noremap = true;
    }

    {
      key = "h";
      action = "i";
      mode = [
        "n"
        "v"
      ];
      options.noremap = true;
    }
    {
      key = "j";
      action = "o";
      mode = [
        "n"
        "v"
      ];
      options.noremap = true;
    }
    {
      key = "k";
      action = "n";
      mode = [
        "n"
        "v"
      ];
      options.noremap = true;
    }
    {
      key = "l";
      action = "e";
      mode = [
        "n"
        "v"
      ];
      options.noremap = true;
    }
    {
      key = "<leader>we";
      action = "<cmd>wincmd w<CR>";
      mode = "n";
      options.desc = "Cycle next window";
    }
    {
      key = "<leader>wi";
      action = "<cmd>wincmd W<CR>";
      mode = "n";
      options.desc = "Cycle previous window";
    }
    {
      key = "<leader>be";
      action = "<cmd>bnext<CR>";
      mode = "n";
      options.desc = "Cycle next buffer";
    }
    {
      key = "<leader>bi";
      action = "<cmd>bprevious<CR>";
      mode = "n";
      options.desc = "Cycle previous buffer";
    }
  ];
}
