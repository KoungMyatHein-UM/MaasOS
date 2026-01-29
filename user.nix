{ pkgs, ... }:

{
  services.displayManager.autoLogin = {
      enable = false;
      user = "MaasSec";
    };

  users.users.MaasSec = {
    isNormalUser = true;
    description = "MaasSec";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "wireshark" ];
    initialPassword = "MaasSec";
    shell = pkgs.bash;
  };
}