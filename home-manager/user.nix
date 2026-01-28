{ pkgs, ... }:

{
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    firefox
    git
    htop
  ];

  programs.bash.enable = true;
  programs.git = {
    enable = true;
  };
}