{ pkgs, ... }:

let
  background-image = pkgs.runCommand "maassec-wallpaper" {} ''
    cp ${./../res/maassec_wallpaper.png} $out
  '';
in
{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    theme = "breeze";
    wayland.enable = true;
  };

  environment.systemPackages = [
    (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
      [General]
      background=${background-image}
    '')
  ];
}


