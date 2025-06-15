{ config, pkgs, lib, username, superfreq, ... }: {
  imports = [
    ../../modules/system.nix
    ../../modules/hyprland.nix
    ../../modules/displaylink.nix
    ./hardware-configuration.nix
  ];

  boot.plymouth.enable = true;
  services.power-profiles-daemon.enable = false;
  services.superfreq = {   
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "auto";
        enable_auto_turbo = true;
        turbo_auto_settings = {
          load_threshold_high = 80.0;
          load_threshold_low = 40.0;
          temp_threshold_high = 70.0;
          initial_turbo_state = false;
        };
        epp = "power";
        epb = "balance_power";
        platform_profile = "balanced";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
        enable_auto_turbo = true;
        turbo_auto_settings = {
          load_threshold_high = 70.0;
          load_threshold_low = 30.0;
          temp_threshold_high = 75.0;
          initial_turbo_state = false;
        };
        epp = "performance";
        epb = "balance_performance";
        platform_profile = "performance";
      };
      daemon = {
        poll_inverval_sec = 5;
        adaptive_interval = true;
        min_poll_interval_sec = 1;
        max_poll_interval_sec = 30;
        throttle_on_battery = true;
      };
    };
  };

  hardware.firmware = [
    pkgs.sof-firmware
    pkgs.alsa-firmware
  ];

  virtualisation.libvirtd.enable = true;
  # i have no idea what this does, but on each rebuild the location of firmware
  # changes so i think this should fix it. if not it's getting gutted.
  virtualisation.libvirtd.qemu.ovmf.enable = true;
 
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ username ];
  virtualisation.spiceUSBRedirection.enable = true;
  
  virtualisation.waydroid.enable = true;
  boot.kernelModules = [ "kvm-intel" ];

  programs.adb.enable = true;

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  programs.steam = {
	enable = true;
	remotePlay.openFirewall = true;
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      mesa
      intel-media-sdk
      vaapiIntel
      intel-media-driver
    ];
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.xserver.videoDrivers = lib.mkAfter [ "modesetting" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "jawnson"; # Define your hostname.

  hardware.sensor.iio.enable = true;
  services.fwupd.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput = {
    enable = true;
    touchpad = {
      disableWhileTyping = false;
      additionalOptions = ''
        Option "Tapping" "on"
	Option "PalmDetection" "on"
      '';
    };
    
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    packages = with pkgs; [
      gnomeExtensions.dash-to-dock
      gnomeExtensions.appindicator
      gnome-tweaks
      kdePackages.kdenlive
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    neovim
    google-chrome
    alsa-ucm-conf
    wget
    curl
    fprintd
    usbutils
    neofetch
    easyeffects
    sof-firmware
    btop
    displaylink
    git
    smartmontools
    nvme-cli
    cloudflare-warp
    desktop-file-utils # required by warp client to authenticate
    vulkan-tools
    rnote
    wl-clipboard
  ];

  systemd.packages = [
    pkgs.cloudflare-warp
  ];

  systemd.targets.multi-user.wants = [
    "warp-svc.service"
  ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  services.fprintd = {
    enable = true;
    tod.enable = true;
    tod.driver = pkgs.libfprint-2-tod1-goodix;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
