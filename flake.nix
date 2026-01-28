{
  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
      home-manager = {
        url = "github:nix-community/home-manager/release-25.11";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.MaasOS = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = { inherit home-manager; };

      modules = [
        ./system
        ./user.nix
        ./home-manager
        ./installer.nix
      ];

    };
  };
}


