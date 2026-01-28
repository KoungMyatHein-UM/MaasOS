{ pkgs, ... }:

{
  users.users.MaasSec = {
    isNormalUser = true;
    description = "MaasSec";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    initialPassword = "MaasSec";
    shell = pkgs.bash;
  };
}