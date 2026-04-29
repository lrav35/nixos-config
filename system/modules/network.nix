{ config, pkgs, ... }:

{
  networking.hostName = "xps"; # Define your hostname.
  networking.networkmanager.enable = true;
}
