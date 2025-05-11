{ config, pkgs, ... }:

{
  # Enable Hyprland (assumes NixOS or flakes handle main installation)
  home.packages = [
    pkgs.hyprland
    pkgs.hyprlock
    pkgs.rofi
  ];

  programs.home-manager.enable = true;

  programs.rofi = {
    enable = true;
  };

  # Link a file to ~/.config/hypr/my_config.conf
  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
  home.file.".config/hypr/hyprlock.conf".source = ./hyprlock.conf;

  # Set up xdg config if needed
  xdg.enable = true;
}

