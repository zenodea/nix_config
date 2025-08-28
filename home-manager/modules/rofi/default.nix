{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.rofi
    pkgs.rofi-power-menu
  ];

  programs.rofi = {
    enable = true;
  theme = ./nord.rasi;
  # Add other rofi configuration here
};

}
