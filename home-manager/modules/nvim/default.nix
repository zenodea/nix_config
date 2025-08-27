{ pkgs, ... }:

let
  # Neovim with all treesitter grammars prebuilt
  nvimWithTS = pkgs.neovim.override {
    configure = {
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          nvim-treesitter.withAllGrammars
          plenary-nvim 
        ];
      };
    };
  };
in

{
  home.packages = [
    pkgs.vim 

    # Image support in NVIM
    pkgs.imagemagick

    # Latex Support
    pkgs.texliveFull
    pkgs.ghostscript
    
    # Fuzzy Finder
    pkgs.fzf
  ];

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      tree-sitter
      gcc               # for compiling parsers
      nodejs            # if using Tree-sitter via nvim-treesitter plugin
    ];
  };
  home.file.".config/nvim".source = ./config;
}

