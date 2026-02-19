{
  plugins.fzf-lua.keymaps = {
    "<leader>gc" = {
      action = "git_commits";
      options.desc = "Git commits";
    };

    "<leader>gb" = {
      action = "git_branches";
      options.desc = "Git branches";
    };
  };
}
