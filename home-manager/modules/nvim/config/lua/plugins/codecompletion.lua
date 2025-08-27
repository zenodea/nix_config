return {
  -- Mason does not work with NIX 
  { "williamboman/mason-lspconfig.nvim", enabled = false },
  { "williamboman/mason.nvim", enabled = false },

  -- Configure LSP servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          -- Nix provides lua-language-server
          cmd = { "lua-language-server" },
        },
        nil_ls = {
          -- Nix LSP
          cmd = { "nil" },
        },
        rust_analyzer = {
          cmd = { "rust-analyzer" },
        },
        tsserver = {
          cmd = { "typescript-language-server", "--stdio" },
        },
        pyright = {
          cmd = { "pyright-langserver", "--stdio" },
        },
        gopls = {
          cmd = { "gopls" },
        },
        clangd = {
          cmd = { "clangd" },
        },
      },
    },
  },

  -- Formatter configuration
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        nix = { "nixpkgs_fmt" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        python = { "black" },
        rust = { "rustfmt" },
      },
    },
  },

  -- testing
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter"
    }
  },
}
