{
  programs.nushell = {
    enable = true;
  };

  # not exactly nushell related but it's shell related
  programs.direnv = {
    enable = true;
    enableNushellIntegration = true;
    nix-direnv.enable = true;
  };
}
