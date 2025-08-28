# In your home-manager configuration
{ pkgs,  ... }:
{
  # nixvim version - identical features to regular neovim config
programs.nixvim = {
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;

  globals.mapleader = " ";


    diagnostics = {
      virtual_text = {
        severity = null; # Show all severities
        source = "if_many";
        prefix = "●";
        spacing = 4;
      };
      signs = true;
      underline = true;
      update_in_insert = false;
      severity_sort = true;
    };
  opts = {
    number = true;
    relativenumber = true;
    expandtab = true;
    shiftwidth = 2;
    tabstop = 2;
    smartindent = true;
    wrap = false;
    ignorecase = true;
    smartcase = true;
    termguicolors = true;
  };
 colorschemes.nord = {
      enable = true;
      settings = {
        # Disable borders between vertically split windows
        borders = false;
        
        # Enable contrast for sidebars and floating windows
        contrast = true;
        
        # Cursorline options
        cursorline_transparent = false;
        
        # Enable italic comments
        italic = false;
        
        # Uniform diff background
        uniform_diff_background = false;
        
        # Disable background (set to true for transparency)
        disable_background = false;
      };
    };

  plugins = {
    # LSP
    lsp = {
      enable = true;
      servers = {

        lua_ls = {
          enable = true;
          settings.Lua = {
            runtime.version = "LuaJIT";
            diagnostics.globals = [ "vim" ];
            workspace.library = [
              "\${pkgs.lua}/lib"
              "\${pkgs.vimPlugins.plenary-nvim}"
            ];
            telemetry.enable = false;
          };
        };
        rust_analyzer.enable = true;
        pyright.enable = true;

        # TypeScript/JavaScript - handles React, Next.js automatically
        ts-ls = {
          enable = true;
          # Optional: configure for better React support
          settings = {
            typescript = {
              preferences = {
                includePackageJsonAutoImports = "auto";
              };
            };
            javascript = {
              preferences = {
                includePackageJsonAutoImports = "auto";
              };
            };
          };
        };
        
        # ESLint for linting
        eslint.enable = true;
        
        # JSON for config files
        jsonls.enable = true;
        
        # CSS/Tailwind if you use them
        tailwindcss.enable = true;
        cssls.enable = true;
        gopls.enable = true;
        clangd.enable = true;
        nil_ls.enable = true;
      };
      keymaps = {
        lspBuf = {
          "gd" = "definition";
          "K" = "hover";
          "gi" = "implementation";
          "<C-k>" = "signature_help";
          "<leader>rn" = "rename";
          "<leader>ca" = "code_action";
          "gr" = "references";
          "<leader>f" = "format";
        };
      };
    };

    # Completion
    cmp = {
      enable = true;
                

      settings = {
        window = {
            completion = {
              max_height = 5;          # Show max 5 items
              scrollbar = true;        # Enable scrollbar
              border = "rounded";      # Optional: nicer border
              winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None";
            };
            documentation = {
              max_height = 10;
              scrollbar = true;
              border = "rounded";
            };
         };
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        mapping = {
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif require('luasnip').expand_or_jumpable() then
                require('luasnip').expand_or_jump()
              else
                fallback()
              end
            end, { 'i', 's' })
          '';
          "<S-Tab>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif require('luasnip').jumpable(-1) then
                require('luasnip').jump(-1)
              else
                fallback()
              end
            end, { 'i', 's' })
          '';
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "buffer"; }
          { name = "path"; }
        ];
      };
    };

    # Treesitter
    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
        ensure_installed = [
          "nix"
          "lua" 
          "python"
          "rust"
          "typescript"
          "javascript"
          "go"
          "c"
          "cpp"
          "bash"
          "json"
          "yaml"
          "markdown"
        ];
      };
    };

    # Telescope
    telescope = {
      enable = true;
      extensions.fzf-native.enable = true;
      settings = {
        defaults = {
          file_ignore_patterns = [ "node_modules" ".git" ];
        };
      };
      keymaps = {
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>fb" = "buffers";
        "<leader>fh" = "help_tags";
      };
    };

    # Lualine
    lualine = {
      enable = true;
      settings = {
        options = {
          icons_enabled = true;
          theme = "nord";
          component_separators = { left = ""; right = ""; };
          section_separators = { left = ""; right = ""; };
          globalstatus = false;
        };
        sections = {
          lualine_a = [ "mode" ];
          lualine_b = [ "branch" "diff" "diagnostics" ];
          lualine_c = [
            {
              __unkeyed-1 = "filename";
              file_status = true;
              path = 1;
              shorting_target = 40;
              symbols = {
                modified = "[+]";
                readonly = "[-]";
                unnamed = "[No Name]";
              };
            }
          ];
          lualine_x = [ "encoding" "fileformat" "filetype" ];
          lualine_y = [ "progress" ];
          lualine_z = [ "location" ];
        };
      };
    };

    # Neo-tree
    neo-tree = {
      enable = true;
      closeIfLastWindow = false;
      popupBorderStyle = "rounded";
      enableGitStatus = true;
      enableDiagnostics = true;
      defaultComponentConfigs = {
        container.enableCharacterFade = true;
        indent = {
          indentSize = 2;
          padding = 1;
          withMarkers = true;
          indentMarker = "│";
          lastIndentMarker = "└";
          highlight = "NeoTreeIndentMarker";
        };
          icon = {
            folderClosed = "";
            folderOpen = "";
            folderEmpty = "󰜌";
            default = "*";
          };
        gitStatus = {
          symbols = {
            added = "";
            modified = "";
            deleted = "✖";
            renamed = "󰁕";
            untracked = "";
            ignored = "";
            unstaged = "󰄱";
            staged = "";
            conflict = "";
          };
        };
      };
      window = {
        position = "left";
        width = 40;
        mappingOptions = {
          noremap = true;
          nowait = true;
        };
        mappings = {
          "<space>" = {
            __unkeyed-1 = "toggle_node";
            nowait = false;
          };
          "<2-LeftMouse>" = "open";
          "<cr>" = "open";
          "<esc>" = "cancel";
          "S" = "open_split";
          "s" = "open_vsplit";
          "t" = "open_tabnew";
          "a" = "add";
          "A" = "add_directory";
          "d" = "delete";
          "r" = "rename";
          "y" = "copy_to_clipboard";
          "x" = "cut_to_clipboard";
          "p" = "paste_from_clipboard";
          "c" = "copy";
          "m" = "move";
          "q" = "close_window";
          "R" = "refresh";
          "?" = "show_help";
        };
      };
      filesystem = {
        filteredItems = {
          visible = false;
          hideDotfiles = true;
          hideGitignored = true;
          hideHidden = true;
        };
        followCurrentFile = {
          enabled = false;
          leaveDirsOpen = false;
        };
        groupEmptyDirs = false;
        hijackNetrwBehavior = "open_default";
        useLibuvFileWatcher = false;
        window.mappings = {
          "<bs>" = "navigate_up";
          "." = "set_root";
          "H" = "toggle_hidden";
          "/" = "fuzzy_finder";
          "D" = "fuzzy_finder_directory";
          "#" = "fuzzy_sorter";
          "f" = "filter_on_submit";
          "<c-x>" = "clear_filter";
          "[g" = "prev_git_modified";
          "]g" = "next_git_modified";
        };
      };
    };

    # Essential completion plugins
    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp_luasnip.enable = true;
    luasnip.enable = true;

    # UI plugins
    which-key.enable = true;
  };

  # Extra plugins
  extraPlugins = with pkgs.vimPlugins; [
    vim-tmux-navigator
  ];

  # Key mappings
  keymaps = [
    # Neo-tree
    { mode = "n"; key = "<leader>e"; action = "<cmd>Neotree filesystem toggle left<cr>"; options.silent = true; }
    { mode = "n"; key = "<leader>o"; action = "<cmd>Neotree filesystem focus left<cr>"; options.silent = true; }

    # Tmux Navigator
    { mode = "n"; key = "<C-h>"; action = "<cmd>TmuxNavigateLeft<cr>"; options.silent = true; }
    { mode = "n"; key = "<C-j>"; action = "<cmd>TmuxNavigateDown<cr>"; options.silent = true; }
    { mode = "n"; key = "<C-k>"; action = "<cmd>TmuxNavigateUp<cr>"; options.silent = true; }
    { mode = "n"; key = "<C-l>"; action = "<cmd>TmuxNavigateRight<cr>"; options.silent = true; }
    { mode = "n"; key = "<C-\\>"; action = "<cmd>TmuxNavigatePrevious<cr>"; options.silent = true; }

    # Primagean Tips
    # Move lines in visual mode
    { mode = "v"; key = "J"; action = ":m '>+1<CR>gv=gv"; }
    { mode = "v"; key = "K"; action = ":m '<-2<CR>gv=gv"; }
    
    # Join lines and center
    { mode = "n"; key = "J"; action = "mzJ`z"; }
    
    # Half page jumping with centering
    { mode = "n"; key = "<C-d>"; action = "<C-d>zz"; }
    { mode = "n"; key = "<C-u>"; action = "<C-u>zz"; }
    
    # Auto-indent paragraph
    { mode = "n"; key = "=ap"; action = "ma=ap'a"; }
    
    # LSP restart
    { mode = "n"; key = "<leader>zig"; action = "<cmd>LspRestart<cr>"; }
    
    # Paste without yanking in visual mode
    { mode = "x"; key = "<leader>p"; action = ''"_dP''; }
    
    # System clipboard yank
    { mode = [ "n" "v" ]; key = "<leader>y"; action = ''"+y''; }
    { mode = "n"; key = "<leader>Y"; action = ''"+Y''; }
    
    # Delete without yanking
    { mode = [ "n" "v" ]; key = "<leader>d"; action = ''"_d''; }
    
    # Ctrl+C as Escape
    { mode = "i"; key = "<C-c>"; action = "<Esc>"; }
    
    # Disable Q
    { mode = "n"; key = "Q"; action = "<nop>"; }
    
    # Quickfix navigation
    { mode = "n"; key = "<C-k>"; action = "<cmd>cnext<CR>zz"; }
    { mode = "n"; key = "<C-j>"; action = "<cmd>cprev<CR>zz"; }
    
    # Location list navigation
    { mode = "n"; key = "<leader>k"; action = "<cmd>lnext<CR>zz"; }
    { mode = "n"; key = "<leader>j"; action = "<cmd>lprev<CR>zz"; }
    
    # Search and replace word under cursor
    { mode = "n"; key = "<leader>s"; action = '':%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>''; }
    
    # Make file executable
    { mode = "n"; key = "<leader>x"; action = "<cmd>!chmod +x %<CR>"; options.silent = true; }
  ];

  # Extra configuration
  extraConfigLua = ''
    -- Transparency (same as regular neovim config)
    vim.cmd[[
      highlight! Normal guibg=N8NE ctermbg=NONE
      highlight! NormalNC guibg=NONE ctermbg=NONE
      highlight! Pmenu guibg=NONE
      highlight! PmenuSel guibg=#414868
      highlight! PmenuSbar guibg=NONE
      highlight! PmenuThumb guibg=#7aa2f7
      highlight! NormalFloat guibg=NONE
      highlight! FloatBorder guibg=NONE
      highlight! NeoTreeNormal guibg=NONE
      highlight! NeoTreeNormalNC guibg=NONE
      highlight! NeoTreeEndOfBuffer guibg=NONE
    ]]

    -- Additional Neo-tree keymap for reveal current file
    vim.keymap.set('n', '<leader>E', function()
      vim.cmd('Neotree filesystem reveal left')
    end, { desc = "Reveal current file in Neo-tree", silent = true })
  '';
};
} 
