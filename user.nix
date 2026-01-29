{ pkgs, lib, ... }:

{
  services.displayManager.autoLogin = {
      enable = lib.mkForce false;
      user = lib.mkForce "MaasSec";
    };

  users.users.MaasSec = {
    isNormalUser = true;
    description = "MaasSec";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "wireshark" ];
    initialPassword = "MaasSec";
    shell = pkgs.bash;
  };
}