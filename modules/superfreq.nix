{
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
}
