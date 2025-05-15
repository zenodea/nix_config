{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.wlogout
  ];

  # Link a file to ~/.config/hypr/my_config.conf
   home.file.".config/wlogout/layout".source = ./layout;
}
