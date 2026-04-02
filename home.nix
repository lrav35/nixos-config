{ config, pkgs, ... }: {
  home.username = "coins";
  home.homeDirectory = "/home/coins";
  home.stateVersion = "25.11";
  programs.bash.enable = true;
  
  home.packages = with pkgs; [
    git
    neovim
    btop
    tree
  ];
}
