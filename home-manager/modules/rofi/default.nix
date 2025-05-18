{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.rofi
    pkgs.rofi-power-menu
  ];

  programs.rofi = {
    enable = true;
  };

  home.file.".config/rofi/themes/tokyonight.rasi".source = ./themes/tokyonight.rasi;

}
