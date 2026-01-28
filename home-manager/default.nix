{ home-manager, ... }:

{
  imports = [ home-manager.nixosModules.home-manager ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.MaasSec = import ./home-user.nix;
}