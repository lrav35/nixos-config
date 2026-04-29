{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules
    ];

  system.stateVersion = "25.11"; # Did you read the comment?
}
