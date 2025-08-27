-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  -- Configure LazyVim to use catppuccin instead of tokyonight
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
  
  -- Add catppuccin with green theme and comprehensive transparency toggle
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
      flavour = "mocha",
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true,
      show_end_of_buffer = false,
      term_colors = true,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      no_italic = false,
      no_bold = false,
      no_underline = false,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {
        mocha = {
          -- Green theme overrides
          rosewater = "#a6e3a1",
          flamingo = "#94e2d5",
          pink = "#a6e3a1",
          mauve = "#89b4fa",
          red = "#f38ba8",
          maroon = "#eba0ac",
          peach = "#fab387",
          yellow = "#f9e2af",
          green = "#a6e3a1",
          teal = "#94e2d5",
          sky = "#89dceb",
          sapphire = "#74c7ec",
          blue = "#89b4fa",
          lavender = "#b4befe",
          text = "#cdd6f4",
          subtext1 = "#bac2de",
          subtext0 = "#a6adc8",
          overlay2 = "#9399b2",
          overlay1 = "#7f849c",
          overlay0 = "#6c7086",
          surface2 = "#585b70",
          surface1 = "#45475a",
          surface0 = "#313244",
          base = "#1e1e2e",
          mantle = "#181825",
          crust = "#11111b",
        },
      },
      custom_highlights = function(colors)
        return {
          -- Cursor and selection with green
          Cursor = { bg = colors.green },
          CursorLine = { bg = colors.surface0 },
          CursorLineNr = { fg = colors.green, style = { "bold" } },
          Visual = { bg = colors.surface1, style = { "bold" } },
          
          -- Make certain syntax elements green
          ["@keyword"] = { fg = colors.green, style = { "italic" } },
          ["@keyword.function"] = { fg = colors.green, style = { "italic" } },
          ["@keyword.operator"] = { fg = colors.green },
          ["@operator"] = { fg = colors.green },
          ["@function"] = { fg = colors.green, style = { "italic" } },
          ["@function.call"] = { fg = colors.green },
          ["@method"] = { fg = colors.green, style = { "italic" } },
          ["@method.call"] = { fg = colors.green },
          ["@property"] = { fg = colors.green },
          ["@field"] = { fg = colors.green },
          
          -- LSP and diagnostics
          DiagnosticHint = { fg = colors.green },
          LspSignatureActiveParameter = { bg = colors.green, fg = colors.base },
          
          -- Git signs
          GitSignsAdd = { fg = colors.green },
          GitSignsChange = { fg = colors.peach },
          GitSignsDelete = { fg = colors.red },
          
          -- Telescope with green accents
          TelescopeSelectionCaret = { fg = colors.green },
          TelescopePromptPrefix = { fg = colors.green },
          TelescopeMatching = { fg = colors.green, style = { "bold" } },
          
          -- Which-key
          WhichKey = { fg = colors.green },
          WhichKeyGroup = { fg = colors.blue },
          WhichKeySeparator = { fg = colors.overlay0 },
          WhichKeyDesc = { fg = colors.text },
          
          -- Completion menu
          Pmenu = { bg = colors.surface0, fg = colors.text },
          PmenuSel = { bg = colors.green, fg = colors.base, style = { "bold" } },
          PmenuSbar = { bg = colors.surface1 },
          PmenuThumb = { bg = colors.green },
          
          -- Status line
          StatusLine = { bg = colors.mantle, fg = colors.text },
          StatusLineNC = { bg = colors.mantle, fg = colors.overlay0 },
          
          -- Fix separator line
          WinSeparator = { fg = colors.surface0, bg = "NONE" },
          VertSplit = { fg = colors.surface0, bg = "NONE" },
        }
      end,
      integrations = {
        bufferline = true,
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        noice = true,
        which_key = true,
        telescope = {
          enabled = true,
          style = "nvchad"
        },
        lsp_trouble = true,
        mason = true,
        neotest = true,
        neotree = true,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
      },
    },
  },
  
  -- Keep tokyonight available as fallback
  {
    "folke/tokyonight.nvim",
    lazy = true,
  },
}
