{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    htop
    vim
    wireshark
    tcpdump
  ];
}

