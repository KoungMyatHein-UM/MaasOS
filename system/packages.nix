{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  programs.wireshark.enable = true;

  environment.systemPackages = with pkgs; [
    git
    htop
    vim
    wireshark
    tcpdump
  ];
}

