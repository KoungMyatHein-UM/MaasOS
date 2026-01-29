# DO NOT RENAME THIS FILE
# NixOS expects an entry point default.nix
{ ... }:

{
  imports = [
    ./boot.nix
    ./time.nix
    ./sddm.nix
    ./desktop.nix
    ./packages.nix
    ./networking.nix
    ./hardware-tweaks.nix
    ./extras.nix
  ];
}


