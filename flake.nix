{
  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

      home-manager = {
        url = "github:nix-community/home-manager/release-25.11";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      nur.url = "github:nix-community/NUR";
    };

  outputs = { self, nixpkgs, home-manager, nur, ... }: {
    nixosConfigurations.MaasOS = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = { inherit home-manager nur; };

      modules = [
        ./system
        ./home-manager
        ./user.nix
        ./installer.nix

        {
          nixpkgs.overlays = [ nur.overlays.default ];
        }
      ];

    };
  };
}


