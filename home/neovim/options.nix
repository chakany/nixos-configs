{
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  globals.mapleader = ";";
  extraConfigVim = ''
  highlight Normal guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
  '';
  keymaps = [
    {
      action = "<cmd>vsplit<CR>";
      key = "<leader>v";
      options = {
        silent = true;
	noremap = true;
      };
    }
    {
      action = "<cmd>split<CR>";
      key = "<leader>h";
      options = {
        silent = true;
	noremap = true;
      };
    }
  ];
    opts = {
      termguicolors = true;
      
      expandtab = true;
      shiftwidth = 2;
      softtabstop = 2;

      updatetime = 100; # faster completions
      number = true;
      relativenumber = true;
      signcolumn = "number";

      autoindent = true;
      clipboard = "unnamedplus";
      cursorline = true;
      smartcase = true;
      smartindent = true;

      undofile = true;
      undolevels = 10000;
    };
}
