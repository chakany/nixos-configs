{ pkgs, ... }: {
  imports = [
    ../home/core.nix

    ../home/gui
    ../home/neovim
    ../home/git.nix
    ../home/helix.nix
    ../home/shell.nix
  ];
}
