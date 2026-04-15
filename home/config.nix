{ config, lib, pkgs, ... }:

{
  home.file.".config/nvim".source = ./config/nvim;
}
