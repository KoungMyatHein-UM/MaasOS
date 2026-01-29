{ pkgs, lib, ... }:

let
  wallpaper = ./maassec_wallpaper.png;
in
{
  home.stateVersion = "25.11";

  systemd.user.services.set-wallpaper = {
      Unit = {
        Description = "Force MaasOS Wallpaper";
        After = [ "graphical-session.target" ];
        Partof = [ "graphical-session.target" ];
      };
      Service = {
        Type = "oneshot";
        # It waits 2 seconds for the shell to breathe, then fires the command you verified
        ExecStart = "${pkgs.bash}/bin/bash -c 'sleep 2; ${pkgs.kdePackages.plasma-desktop}/bin/plasma-apply-wallpaperimage ${wallpaper}'";
        RemainAfterExit = true;
      };
      Install.WantedBy = [ "graphical-session.target" ];
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