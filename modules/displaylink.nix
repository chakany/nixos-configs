{ pkgs, lib, ... }: {
  services.xserver.videoDrivers = lib.mkBefore [ "displaylink" ];
  systemd.services.dlm.wantedBy = [ "multi-user.target" ];

  environment.systemPackages = lib.mkAfter [ pkgs.displaylink ];
}
