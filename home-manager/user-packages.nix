{ pkgs, ... }:

{
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
    jupyter-lab

    ### python
    (python3.withPackages (ps: with ps; [
          pip
          pwntools
          scapy
          requests
          paramiko
          cryptography
          pycryptodome
          jupyterlab
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
}

