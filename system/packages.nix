{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox
    git
    htop
  ];
}

