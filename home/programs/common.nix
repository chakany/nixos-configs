{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    spotify
    signal-desktop
    obs-studio
    discord
    filezilla
    jetbrains.datagrip
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        bbenoist.nix
      ];
    })
    orca-slicer
    ripgrep
  ];

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
