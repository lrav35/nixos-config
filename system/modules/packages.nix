{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    unzip
    home-manager
  ];
}
