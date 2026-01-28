{ pkgs, ... }:

{
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    firefox
  ];

  programs.bash.enable = true;
  programs.git = {
    enable = true;
  };
}