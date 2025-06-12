{ config, pkgs, ... }:

{
  # Enable Hyprland (assumes NixOS or flakes handle main installation)
  home.packages = [
    pkgs.git
    pkgs.gh
    pkgs.tmux
    pkgs.neofetch
  ];

  home.file.".config/ghostty/config".source = ./config;
}
