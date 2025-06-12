{ config, pkgs, ... }:

{
  # Link a file to ~/.config/hypr/my_config.conf
  home.file.".tmux_conf".source = ./config;
}
