{ pkgs, ... }:

let
  wallpaper = ./../home-manager/maassec_wallpaper.png;
in
{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    # We will use the default breeze but override the background via etc
  };

  # SDDM on NixOS 25.11 looks here for theme overrides.
  # This avoids the 'cp' error entirely by just writing the one file we need.
  environment.etc."sddm/themes/breeze/theme.conf.user".text = ''
    [General]
    background=${wallpaper}
  '';
}


