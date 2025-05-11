{ config, pkgs, ... }:

{
  # Link a file to ~/.config/hypr/my_config.conf
  home.file.".config/vifm".source = ./config;
}
