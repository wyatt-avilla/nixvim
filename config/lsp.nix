{
  plugins.lsp = {
    enable = true;
    servers = {
	  nixd.enable = true;

      ruff = {
        enable = true;
        extraOptions.init_options.settings = {
          lint = {
            select = [ "ALL" ];
            ignore = [ "D" "CPY" "T20" "E501" ];
          };
	    };
      };

      rust_analyzer = {
        enable = true;
		installRustc = false;
		installCargo = false;

	    settings = {
	      checkOnSave = true;
	      check = {
	        command = "clippy";
	        extraArgs = [ "--" "-W" "clippy::pedantic" ];
	      };
	    };
      };
    };
  };
}
