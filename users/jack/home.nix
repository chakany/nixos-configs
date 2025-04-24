{ pkgs, ... }: {
  imports = [
    ../../home/core.nix
    ../../home/neovim
    ../../home/programs
  ];

  programs.git = {
    userName = "Jack Chakany";
    userEmail = "jack@chakany.systems";
  };
}
