{ pkgs, lib, ... }:

#let
#  wallpaper-image = pkgs.runCommand "maassec-wallpaper-desktop" {} ''
#      cp ${./maassec_wallpaper.png} $out
#    '';
#in
{
  imports = [ ./user-packages.nix ];

  home.stateVersion = "25.11";

#  home.packages = [
#      (pkgs.writeTextDir ".config/plasma-org.kde.plasma.desktop-appletsrc" ''
#        [SerializationSettings]
#        FreeCanvases=1
#
#        [Containments][1]
#        WallpaperPlugin=org.kde.image
#
#        [Containments][1][Wallpaper][org.kde.image][General]
#        Image=file://${wallpaper-image}
#      '')
#    ];
#
#    home.file.".local/share/wallpapers/maassec_wallpaper.png".source = ./maassec_wallpaper.png;

  programs.bash.enable = true;
  programs.git = {
    enable = true;
  };

  programs.firefox = {
      enable = true;
      profiles.maassec = {
        id = 0;
        isDefault = true;
        settings = {
          "browser.startup.homepage" = "https://github.com/KoungMyatHein-UM/MaasOS";
          "browser.search.region" = "NL";
          "browser.shell.checkDefaultBrowser" = true;
        };

        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          #ublock-origin
          #bitwarden
        ];
      };
    };
}