{ config, pkgs, ... }:

{
  users.users.coins = {
      isNormalUser = true;
      description = "coins";
      extraGroups = [ "networkmanager" "wheel" ];
    };
}
