{ ... }:

let
  wallpaper = ./../home-manager/maassec_wallpaper.png;
in
{
  services.desktopManager.plasma6.enable = true;
  services.displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;

        settings = {
          Theme = {
            CursorTheme = "breeze_cursors";
          };
        };
      };
    };

    systemd.tmpfiles.rules = [
        "L+ /usr/share/sddm/themes/breeze/MaasSec_BG.png - - - - ${wallpaper}"
      ];
}


