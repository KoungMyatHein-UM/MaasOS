{ pkgs, lib, ... }:

{
  home.stateVersion = "25.11";

  home.file.".local/share/wallpapers/maassec_wallpaper.png".source = ./maassec_wallpaper.png;
  home.activation.setWallpaper = lib.hm.dag.entryAfter ["writeBoundary"] ''
      ${pkgs.kdePackages.plasma-desktop}/bin/plasma-apply-wallpaperimage ~/.local/share/wallpapers/maassec_wallpaper.png
    '';
  home.file.".config/autostart/set-wallpaper.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Set MaasOS Wallpaper
      Exec=${pkgs.kdePackages.plasma-desktop}/bin/plasma-apply-wallpaperimage ${wallpaper_file}
      X-KDE-Autostart-phase=1
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