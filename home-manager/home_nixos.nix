{ config, pkgs, lib, ... }:

{
  home.username ="zenodea";
  home.homeDirectory = "/home/zenodea";

  # Packages that should be installed to the user profile.
  imports = [
    ./modules/ghostty/default.nix
    ./modules/nvim/default.nix
    ./modules/waybar/default.nix
    ./modules/cursor/default.nix
    ./modules/rofi/default.nix
    ./modules/fuzzel/default.nix
    ./modules/hyprland/default.nix
    ./modules/vifm/default.nix
    ./modules/tmux/default.nix
  ];

  home.packages =  [
    # No Darwin package, thus must be removed from shared config
    pkgs.ghostty

    pkgs.htop
    pkgs.fortune

    # gaming 
    pkgs.steam
    pkgs.discord
    pkgs.spotify

    # Utility
    pkgs.obsidian
    pkgs.zoom-us
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
