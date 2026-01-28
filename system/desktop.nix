{ ... }:

let
  wallpaper = ./../home-manager/maassec_wallpaper.png;
in
{
  services.desktopManager.plasma6.enable = true;
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    systemd.tmpfiles.rules = [
        "L+ /usr/share/sddm/themes/breeze/MaasSec_BG.png - - - - ${wallpaper}" [cite: 29]
        "d /var/lib/sddm/.config 0700 sddm sddm - -"
        "f /usr/share/sddm/themes/breeze/theme.conf.user 0644 root root - Background=MaasSec_BG.png"
      ];
}


