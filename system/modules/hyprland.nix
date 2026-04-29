{ config, pkgs, ... }:

{
    programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland = {
        enable = true;
      };
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };

    xdg.portal = {
       enable = true;
       wlr.enable = false;
       xdgOpenUsePortal = false;
       extraPortals = [
         pkgs.xdg-desktop-portal-hyprland
         pkgs.xdg-desktop-portal-gtk
       ];
    };

    environment.systemPackages = with pkgs; [
      hyprpaper
      kitty
      libnotify
      qt5.qtwayland
      qt6.qtwayland
      swayidle
      swaylock-effects
      wlogout
      wl-clipboard
      waybar
    ];
}
