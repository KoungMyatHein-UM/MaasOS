# DO NOT RENAME THIS FILE
# NixOS expects an entry point default.nix
{ home-manager, ... }:

{
  imports = [ home-manager.nixosModules.home-manager ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.MaasSec = import ./home-user.nix;
}