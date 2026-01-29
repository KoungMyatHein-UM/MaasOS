{ pkgs, lib, ... }:

#let
#  wallpaper-image = pkgs.runCommand "maassec-wallpaper-desktop" {} ''
#      cp ${./maassec_wallpaper.png} $out
#    '';
#in
{
  home.stateVersion = "25.11";

#  home.packages = [
#      (pkgs.writeTextDir ".config/plasma-org.kde.plasma.desktop-appletsrc" ''
#        [SerializationSettings]
#        FreeCanvases=1
#
#        [Containments][1]
#        WallpaperPlugin=org.kde.image
#
#        [Containments][1][Wallpaper][org.kde.image][General]
#        Image=file://${wallpaper-image}
#      '')
#    ];
#
#    home.file.".local/share/wallpapers/maassec_wallpaper.png".source = ./maassec_wallpaper.png;

  home.packages = with pkgs; [
    ### network analysis
    # wireshark - in system packages: requires low-level system access
    # tcpdump - same as wireshark
    sniffnet
    aircrack-ng
    ethtool
    util-linux
    net-tools

    ### web security
    burpsuite
    zap # aka zaproxy
    nikto
    sqlmap
    dirb
    # curl - already exists by default
    wget

    ### vulnerability assessment
    openvas-scanner
    thc-hydra
    john
    hashcat

    ### reverse engineering
    binwalk
    binutils
    strace
    ltrace
    steghide
    wineWowPackages.stable
    winetricks

    ### dev & scripting
    stdenv.cc # aka build-essential
    autoconf
    automake
    libtool
    pkg-config
    # shtool - not found
    # git - included in system packages
    jq

    ### python
    (python3.withPackages (ps: with ps; [
          pip
          pwntools
          scapy
          requests
          paramiko
          cryptography
          pycryptodome
          jupyter-lab
        ]))

    ### cryptography
    openssl
    gnupg

    ### ops & visibility
    tmux
    asciinema
    flameshot
    polybar
    # htop - included in system packages
  ];

  programs.bash.enable = true;
  programs.git = {
    enable = true;
  };

  programs.firefox = {
      enable = true;
      profiles.maassec = {
        id = 0;
        isDefault = true;
        settings = {
          "browser.startup.homepage" = "https://github.com/KoungMyatHein-UM/MaasOS";
          "browser.search.region" = "NL";
          "browser.shell.checkDefaultBrowser" = true;
        };

        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          #ublock-origin
          #bitwarden
        ];
      };
    };
}