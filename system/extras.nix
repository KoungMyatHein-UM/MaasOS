{ ... }:

{
  programs.wireshark.enable = true;
  users.users.nixos.extraGroups = [ "wireshark" ];
}