{ config, pkgs, ... }:

{
  # Enable Hyprland (assumes NixOS or flakes handle main installation)
  home.packages = [
    pkgs.git
    pkgs.gh
    pkgs.tmux
  ];

  home.file.".config/ghostty/config".source = ./config;
}
