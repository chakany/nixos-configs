{ pkgs, nixvim, ... }: {
  imports = [
    nixvim.homeManagerModules.nixvim
  ];

  home = {
    packages = with pkgs; [
      ripgrep
      goose-cli
      cachix
      devenv
    ];

    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
