{ ... }:

let
  wallpaper = ./../home-manager/maassec_wallpaper.png;
in
{
  services.desktopManager.plasma6.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "maassec-breeze";
  };

  environment.systemPackages = [
    (pkgs.runCommand "maassec-sddm-theme" { } ''
      mkdir -p $out/share/sddm/themes/maassec-breeze
      # Copy the original Breeze theme structure
      cp -r ${pkgs.kdePackages.sddm-kcm}/share/sddm/themes/breeze/* $out/share/sddm/themes/maassec-breeze/

      # Overwrite the background setting in the theme config
      chmod +w $out/share/sddm/themes/maassec-breeze/theme.conf
      echo "[General]" > $out/share/sddm/themes/maassec-breeze/theme.conf.user
      echo "background=${wallpaper}" >> $out/share/sddm/themes/maassec-breeze/theme.conf.user
    '')
  ];
}


