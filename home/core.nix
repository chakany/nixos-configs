{ nixvim, username, ... }: {
  imports = [
    nixvim.homeManagerModules.nixvim
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
