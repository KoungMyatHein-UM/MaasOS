{ pkgs, ... }:

{
  users.users.MaasSec = {
    isNormalUser = true;
    description = "MaasSec Organizational User";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    initialPassword = "MaasSec";
    shell = pkgs.bash;
  };
}