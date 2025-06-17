{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false; # Disable VSCode self-update and let Home Manager to manage VSCode versions instead.
    enableExtensionUpdateCheck = false; # Disable extensions auto-update and let nix4vscode manage updates and extensions
    package = pkgs.vscode.fhs;
  };

  nixpkgs.config.allowUnfree = true;
}
