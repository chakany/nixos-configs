{
  plugins.telescope = {
    enable = true;
    extensions.file-browser = {
      enable = true;
    };
    keymaps = {
      "<leader>ff" = {
        action = "find_files";
      };
      "<leader>fg" = {
        action = "live_grep";
      };
      "<leader>fb" = {
        action = "file_browser";
      };
      "<leader>b" = {
        action = "buffers";
      };
    };
  };
}
