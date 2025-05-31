{ pkgs, ... }: {
  imports = [
    ../../home/core.nix
    ../../home/neovim
    ../../home/zed
    ../../home/helix
    ../../home/programs
    ../../home/hyprland
  ];

  programs.git = {
    userName = "Jack Chakany";
    userEmail = "jack@chakany.systems";
  };
}
