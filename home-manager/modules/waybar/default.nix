{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.waybar
    pkgs.blueman
    pkgs.pavucontrol
  ];

  # Link a file to ~/.config/hypr/my_config.conf
  home.file.".config/waybar".source = ./config;
}
