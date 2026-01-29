{ pkgs, lib, ... }:

let
  wallpaper = ./maassec_wallpaper.png;
in
{
  home.stateVersion = "25.11";

  home.file.".local/share/wallpapers/maassec_wallpaper.png".source = wallpaper;
  systemd.user.services.set-maassec-wallpaper = {
      Unit = {
        Description = "Set MaasOS Desktop Wallpaper";
        After = [ "graphical-session.target" ];
        Partof = [ "graphical-session.target" ];
      };

      Service = {
        Type = "oneshot";
        # We use a slight delay and then the command you verified manually
        ExecStart = "${pkgs.bash}/bin/bash -c 'sleep 3; ${pkgs.kdePackages.plasma-desktop}/bin/plasma-apply-wallpaperimage ${wallpaper}'";
      };

      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };

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