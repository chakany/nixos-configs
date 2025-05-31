{ pkgs, lib, ... }: {
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
  };
}
