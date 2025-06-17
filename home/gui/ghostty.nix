{ ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "GruvboxDarkHard";
      background-opacity = 0.9;
      command = "nu";
    };
  };
}
