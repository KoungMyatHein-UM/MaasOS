{ modulesPath, ... }:

{
  imports = [
#    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    "${modulesPath}/installer/cd-dvd/installation-cd-graphical-calamares-plasma6.nix"
    "${modulesPath}/installer/cd-dvd/channel.nix"
  ];

  installer.cloneConfig = true;

  welcomeWidget.enable = true;
}