{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    spotify
    signal-desktop
    obs-studio
    discord
    filezilla
    jetbrains.datagrip
    orca-slicer
    ripgrep
    android-studio
    libreoffice-fresh
    goose-cli
    cachix
    moonlight-qt
  ];

  programs.vscode = {
    enable = true;
    enableUpdateCheck = false; # Disable VSCode self-update and let Home Manager to manage VSCode versions instead.
    enableExtensionUpdateCheck = false; # Disable extensions auto-update and let nix4vscode manage updates and extensions
    package = pkgs.vscode.fhs;
  };

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "GruvboxDarkHard";
      background-opacity = 0.9;
      command = "nu";
    };
  };

  programs.nushell = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    enableNushellIntegration = true;
    nix-direnv.enable = true;
  };
}
