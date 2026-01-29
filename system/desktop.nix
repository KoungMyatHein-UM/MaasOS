{ pkgs, ... }:

let
  # This creates a proper derivation for the image file
  background-image = pkgs.runCommand "maassec-wallpaper" {} ''
    cp ${./../home-manager/maassec_wallpaper.png} $out
  '';
in
{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    theme = "breeze"; # Ensure it is set to the default theme
    wayland.enable = true;
  };

  # This places the user config file in the system path where Breeze looks
  environment.systemPackages = [
    (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
      [General]
      background=${background-image}
    '')
  ];
}


