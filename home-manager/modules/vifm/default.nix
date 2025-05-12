{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.vifm
  ];

  # Link a file to ~/.config/hypr/my_config.conf
  home.file.".config/vifm".source = ./config;
}
