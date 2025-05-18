{ config, pkgs, userSettings, inputs, ... }:

{
home.pointerCursor = {
  name = "Bibata-Modern-Classic"; # or any other cursor theme
  package = pkgs.bibata-cursors;
  size = 32; # You can adjust the size as needed
  gtk.enable = true;
  x11.enable = true;
};
}
