let
  colorPairFrom = hl: ''
    (function() 
      local _, hl = pcall(vim.api.nvim_get_hl_by_name, "${hl}", true)

      for _, key in pairs({"foreground", "background", "special"}) do
          if hl[key] then
              hl[key] = string.format("#%06x", hl[key])
          end
      end

      local darken_amount = 0.6

      hex = hl.foreground:gsub("#", "")
      
      local r = tonumber(hex:sub(1,2), 16)
      local g = tonumber(hex:sub(3,4), 16)
      local b = tonumber(hex:sub(5,6), 16)
      
      dark_r = math.max(0, math.min(255, math.floor(r * (1 - darken_amount))))
      dark_g = math.max(0, math.min(255, math.floor(g * (1 - darken_amount))))
      dark_b = math.max(0, math.min(255, math.floor(b * (1 - darken_amount))))

      return {
    	bg = string.format("#%02X%02X%02X", r, g, b);
    	fg = string.format("#%02X%02X%02X", dark_r, dark_g, dark_b);
      }
    end)()
  '';
in

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

        "<C-u>" = [
          "scroll_documentation_up"
          "fallback"
        ];

        "<C-d>" = [
          "scroll_documentation_down"
          "fallback"
        ];
      };

      completion.menu.draw.padding = 0;

      appearance = {
        kind_icons = {
          Text = " 󰉿 ";
          Method = " 󰊕 ";
          Function = " 󰊕 ";
          Constructor = " 󰒓 ";

          Field = " 󰜢 ";
          Variable = " 󰆦 ";
          Property = " 󰖷 ";

          Class = " 󱡠 ";
          Interface = " 󱡠 ";
          Struct = " 󱡠 ";
          Module = " 󰅩 ";

          Unit = " 󰪚 ";
          Value = " 󰦨 ";
          Enum = " 󰦨 ";
          EnumMember = " 󰦨 ";

          Keyword = " 󰻾 ";
          Constant = " 󰏿 ";

          Snippet = " 󱄽 ";
          Color = " 󰏘 ";
          File = " 󰈔 ";
          Reference = " 󰬲 ";
          Folder = " 󰉋 ";
          Event = " 󱐋 ";
          Operator = " 󰪚 ";
          TypeParameter = " 󰬛 ";
        };
      };
    };
  };

  highlight = {
    BlinkCmpKindKeyword.__raw = colorPairFrom "Keyword";
    BlinkCmpKindEnum.__raw = colorPairFrom "@lsp.type.enum";
    BlinkCmpKindClass.__raw = colorPairFrom "@lsp.type.class";
    BlinkCmpKindEvent.__raw = colorPairFrom "@lsp.type.event";
    BlinkCmpKindField.__raw = colorPairFrom "@field";
    BlinkCmpKindValue.__raw = colorPairFrom "@field";
    BlinkCmpKindText.__raw = colorPairFrom "@text";
    BlinkCmpKindMethod.__raw = colorPairFrom "@lsp.type.method";
    BlinkCmpKindStruct.__raw = colorPairFrom "@lsp.type.struct";
    BlinkCmpKindFunction.__raw = colorPairFrom "@lsp.type.function";
    BlinkCmpKindOperator.__raw = colorPairFrom "@lsp.type.operator";
    BlinkCmpKindModule.__raw = colorPairFrom "@module";
    BlinkCmpKindVariable.__raw = colorPairFrom "@lsp.type.string";
    BlinkCmpKindConstant.__raw = colorPairFrom "@lsp.type.string";
    BlinkCmpKindInterface.__raw = colorPairFrom "@lsp.type.interface";
    BlinkCmpKindEnumMember.__raw = colorPairFrom "@lsp.type.enumMember";
    BlinkCmpKindConstructor.__raw = colorPairFrom "@lsp.type.method";
    BlinkCmpKindTypeParameter.__raw = colorPairFrom "@lsp.type.typeParameter";
    BlinkCmpKindTypeProperty.__raw = colorPairFrom "@lsp.type.property";
    BlinkCmpKindFile.__raw = colorPairFrom "@lsp.type.parameter";
    BlinkCmpKindUnit.__raw = colorPairFrom "@lsp.type.parameter";
    BlinkCmpKindFolder.__raw = colorPairFrom "@lsp.type.parameter";

    BlinkCmpKindColor.__raw = colorPairFrom "@text";
    BlinkCmpKindSnippet.__raw = colorPairFrom "@text";
    BlinkCmpKindProperty.__raw = colorPairFrom "@text";
    BlinkCmpKindReference.__raw = colorPairFrom "@text";
  };
}
