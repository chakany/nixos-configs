{ pkgs, ... }: {
  imports = [
    ./browsers.nix
    ./ghostty.nix
    ./vscode.nix
    ./zed.nix
  ];

  home.packages = with pkgs; [
    spotify
    signal-desktop
    obs-studio
    discord
    filezilla
    jetbrains.datagrip
    orca-slicer
    android-studio
    libreoffice-fresh
    moonlight-qt
    jetbrains.idea-ultimate
  ];
}
