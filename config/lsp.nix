{
  plugins.lsp = {
    enable = true;
    servers = {
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
	installCargo = true;
	installRustc = true;
	installRustfmt = true;

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
