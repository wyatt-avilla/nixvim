{
  plugins.blink-cmp = {
    enable = true;
    autoLoad = true;

    settings = {
      completion.documentation.auto_show = true;

      keymap = {
        preset = "enter";

        "<Tab>" = [
          "select_next"
          "fallback"
        ];

        "<S-Tab>" = [
          "select_prev"
          "fallback"
        ];
      };
    };
  };
}
