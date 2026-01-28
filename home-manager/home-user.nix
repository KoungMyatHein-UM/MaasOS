{ pkgs, lib, ... }:

let
  wallpaper_file = ./maassec_wallpaper.png;
in
{
  home.stateVersion = "25.11";

  home.file.".local/share/wallpapers/maassec_wallpaper.png".source = wallpaper_file;
  home.file.".config/autostart/set-wallpaper.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Set MaasOS Wallpaper
      Exec=sh -c "sleep 15 && ${pkgs.kdePackages.plasma-desktop}/bin/plasma-apply-wallpaperimage ${wallpaper_file}"
      X-KDE-Autostart-phase=2
    '';

  home.packages = with pkgs; [
  ];

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