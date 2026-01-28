{ pkgs, ... }:

{
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "nvme" "sd_mod" ];

  #boot.kernelPackages = pkgs.linuxPackages;
}