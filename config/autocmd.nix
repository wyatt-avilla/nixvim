{
  autoCmd = [
    {
      command = "setlocal spell";
      event = [ "Filetype" ];
      pattern = [ "markdown,gitcommit,tex" ];
    }
    {
      event = [ "TextYankPost" ];
      callback.__raw = "function() vim.highlight.on_yank() end";
    }
  ];
}
