{
  plugins.copilot-lua = {
    enable = true;

    settings = {
      suggestion = {
        auto_trigger = true;

        keymap = {
          accept = "<right>";
        };
      };
    };

    luaConfig.post = ''
      require("copilot.command").disable()
    '';
  };
}
