{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

  outputs = { self, nixpkgs }: {
    nixosConfigurations.live = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./system
        ({ modulesPath, ... }: {
          imports = [
            "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
          ];

          hardware.enableRedistributableFirmware = true;
          boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "nvme" "sd_mod" ];
          services.desktopManager.plasma6.enable = true;
          services.displayManager.sddm.enable = true;
        })
      ];

    };
  };
}


