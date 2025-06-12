{ pkgs, system, lib, ... }: {
  
  # macOS-specific packages
  environment.systemPackages = with pkgs; [
  
  ];

    # Enable nix daemon
  services.nix-daemon.enable = true;
  
  # Enable experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
    #
  # System preferences
  system.defaults = {
    dock.autohide = true;
    finder.AppleShowAllExtensions = true;
  };
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zenodeangeli = {
    home = lib.mkDefault "/Users/zenodeangeli/";
    description = "Zeno de Angeli";
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Homebrew for things not available in Nix
  homebrew = {
    enable = true;
    casks = [
    ];
  };

  system.stateVersion = 5;

programs.zsh = {
    enable = true;
  };
}
