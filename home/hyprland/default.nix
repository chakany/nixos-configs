{ pkgs, config, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
  };

  programs.fuzzel = {
    enable = true;
  };

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    monitor = [
      "desc:AU Optronics 0x583D,preferred,0x0,1"
      "desc:ASUSTek COMPUTER INC VG248 N3LMQS092193,preferred,0x-1080,1"
      "desc:LG Electronics LG ULTRAWIDE 0x0006A185,preferred,0x-2160,1"
    ];
    bind =
      [
        "$mod, Q, exec, ghostty"
        "$mod, W, exec, google-chrome"
	      "$mod, space, exec, fuzzel"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );

      #misc.disable_hyprland_logo = true;
  };

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 18;
  };

  gtk = {
    enable = true;
  };

  wayland.windowManager.hyprland.systemd.variables = ["--all"];
}
