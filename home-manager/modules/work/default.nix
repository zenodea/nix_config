{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.slack
    pkgs.yarn
    pkgs.nodejs
  ];

}
