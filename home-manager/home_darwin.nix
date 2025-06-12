{ config, pkgs, lib, ... }:

{
  home.username = "zenodeangeli";
  home.homeDirectory = "/Users/zenodeangeli";

  # Packages that should be installed to the user profile.
  imports = [
    ./modules/ghostty/default.nix
    ./modules/nvim/default.nix
    ./modules/vifm/default.nix
    ./modules/borders/default.nix
    ./modules/tmux/default.nix
  ]; 

  home.packages =  [
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
