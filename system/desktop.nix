{ ... }:

let
  wallpaper = ./../home-manager/maassec_wallpaper.png;
in
{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    settings = {
      Theme = {
        CursorTheme = "breeze_cursors";
      };
    };
  };

  environment.etc."sddm/themes/breeze/theme.conf.user".text = ''
    [General]
    background=${wallpaper}
  '';
}


