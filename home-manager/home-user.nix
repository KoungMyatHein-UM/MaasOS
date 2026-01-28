{ pkgs, lib, ... }:

let
  wallpaper = ./maassec_wallpaper.png;
in
{
  home.stateVersion = "25.11";

  home.file.".local/share/wallpapers/maassec_wallpaper.png".source = wallpaper;
  home.file.".config/autostart/set-wallpaper.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Set MaasOS Wallpaper
      # The script waits up to 20 seconds for plasmashell to appear
      Exec=sh -c "for i in {1..20}; do if pgrep -x plasmashell > /dev/null; then sleep 2; ${pkgs.kdePackages.plasma-desktop}/bin/plasma-apply-wallpaperimage ${wallpaper}; break; fi; sleep 1; done"
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