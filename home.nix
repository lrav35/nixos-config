{ config, lib, pkgs, pkgs-unstable, inputs, ... }: {
  home.username = "coins";
  home.homeDirectory = "/home/coins";
  home.stateVersion = "25.11";
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
  programs.bash = {
    enable = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#xps";
      fullRebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#xps && home-manager switch --flake ~/nixos-config/ -b backup";
      homeRebuild = "home-manager switch --flake ~/nixos-config/ -b backup";
    };

    profileExtra = ''
      ## Source .bashrc for aliases and interactive settings on login shells
      if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
      fi

      ## Start Hyprland with UWSM (adapted from your Arch setup) ###
      if [ -z "$WAYLAND_DISPLAY" ] \
         && [ "$(tty)" = "/dev/tty1" ] \
         && [ -z "$SSH_CLIENT" ] \
         && [ -z "$SSH_TTY" ] \
         && uwsm check may-start; then

        exec uwsm start hyprland-uwsm.desktop
      fi
    ''; 
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
