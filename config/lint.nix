{
  plugins.lint = {
    enable = true;
	autoLoad = true;

	lintersByFt = {
	  python = [ "mypy" ];
	  sh = [ "shellcheck" ];
	  c = [ "clangtidy" ];
	  cpp = [ "clangtidy" ];
	  markdown = [ "markdownlint" ];
	};
  };
}
