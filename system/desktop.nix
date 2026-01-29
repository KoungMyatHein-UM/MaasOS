{ pkgs, ... }:

let
  wallpaper = ./../home-manager/maassec_wallpaper.png;
in
{
  services.desktopManager.plasma6.enable = true;
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    # This forcibly replaces the default Breeze background with your file
    # It works because SDDM will always look at this path first
    systemd.tmpfiles.rules = [
      "L+ /usr/share/sddm/themes/breeze/components/artwork/background.png - - - - ${wallpaper}"
    ];
}


