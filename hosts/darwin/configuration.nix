{ pkgs, system, lib, ... }: {
  
  # macOS-specific packages
  environment.systemPackages = with pkgs; [
  ];

    # Enable nix daemon
  services.nix-daemon.enable = true;
  
  # Enable experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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
        taps = [
      "FelixKratz/formulae"
      "nikitabobko/tap"
      # Add any custom taps you need
    ];
    # Homebrew packages to install
    brews = [
      "sketchybar"
      "borders"
      # Add your desired brew packages here
    ];
    
    # Homebrew casks to install
    casks = [
      "nikitabobko/tap/aerospace"
      # Add your desired cask packages here
    ];
    
    # Mac App Store apps
    masApps = {
      # "App Name" = app_id;
    };
  };

  system.stateVersion = 5;
  system.activationScripts.setWallpaper = {
    text = ''
      /usr/bin/osascript -e 'tell application "System Events" to tell every desktop to set picture to "../../misc/irelia_2b.jpg"'
    '';
  };
}
