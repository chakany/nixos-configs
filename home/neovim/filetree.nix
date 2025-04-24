{ lib, ... }: {
  keymaps = lib.mkAfter [
    {
      action = "<cmd>CHADopen<cr>";
      key = "<leader>ft";
    }
  ];
  plugins.chadtree = {
    enable = true;
  };
}
