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

    luaConfig.pre = ''
      if not vim.g.started_by_firenvim and #vim.api.nvim_list_uis() == 0 then
        require("copilot.command").disable = function() end
        require("copilot.client").get = function() return { is_disabled = true } end
      end
    '';

    luaConfig.post = ''
      require("copilot.command").disable()
    '';
  };
}
