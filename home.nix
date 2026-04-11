{ config, lib, pkgs, pkgs-unstable, inputs, ... }: {
  home.username = "coins";
  home.homeDirectory = "/home/coins";
  home.stateVersion = "25.11";
  programs.bash.enable = true;
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
	addKeysToAgent = "yes";
      };
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/xps_key";
       };
    };
  };
  services.ssh-agent = {
    enable = true;
    enableBashIntegration = true;
  };
  
  home.packages = with pkgs; [
    git
    neovim
    btop
    tree
  ];
}
