{ pkgs, lib, ... }: {
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  programs.hyprland.enable = true;

  # Configure X11 keymap
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
