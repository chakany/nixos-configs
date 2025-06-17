{
  programs.helix = {
    enable = true;
    settings = {
      theme = "gruvbox_dark_hard";
      editor = {
        line-number = "relative";
        lsp = {
          display-messages = true;
          display-progress-messages = true;
          display-inlay-hints = true;
        };
	indent-guides = {
          render = true;
	  skip-levels = 2;
	};
	inline-diagnostics = {
	  cursor-line = "error";
	  other-lines = "hint";
	};
	cursor-shape = {
          normal = "block";
	  insert = "bar";
	  select = "underline";
	};
      };
    };
  };
}
