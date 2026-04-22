{ config, lib, pkgs, ... }:

{
  home.file.".config/hypr".source = ./config/hypr;
  home.file.".config/nvim".source = ./config/nvim;
  home.file.".config/waybar".source = ./config/waybar;
  home.file.".config/ghostty".source = ./config/ghostty;
  home.file.".config/fuzzel".source = ./config/fuzzel;
  home.file.".local/share/fonts/BerkeleyMono".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/fonts/BerkeleyMono";
}
