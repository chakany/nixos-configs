{ pkgs, ... }: {
  imports = [
    ../home/gui
    ../home/neovim
    ../home/git.nix
    ../home/helix.nix
    ../home/shell.nix

    ../modules/kdeconnect.nix
  ];

  nix.settings.trusted-users = ["deck"];
}
