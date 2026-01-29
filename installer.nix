{ modulesPath, ... }:

{
  imports = [
  ### This is the minimal installer. You can still install but you gotta use the CLI
#    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"

  ## GUI installer
    "${modulesPath}/installer/cd-dvd/installation-cd-graphical-calamares-plasma6.nix"
    "${modulesPath}/installer/cd-dvd/channel.nix"
  ];

  installer.cloneConfig = true;

  users.users.nixos.enable = false;
}