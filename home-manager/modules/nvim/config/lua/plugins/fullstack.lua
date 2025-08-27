
return {

  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    opts = {
      on_attach = function(client, bufnr)
        -- Disable default tsserver to avoid conflicts
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      settings = {
        -- Organize imports on save
        code_lens = "implementations_only",
        -- Better memory management for large projects
        tsserver_max_memory = 8192,
        -- Include unused imports in completions
        include_completions_with_insert_text = true,
        -- Faster startup
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "literal",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = false,
          includeInlayVariableTypeHints = false,
          includeInlayPropertyDeclarationTypeHints = false,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },

  -- Package.json version management
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    ft = "json",
    keys = {
      { "<leader>ns", "<cmd>lua require('package-info').show()<cr>", desc = "Show package versions" },
      { "<leader>nc", "<cmd>lua require('package-info').hide()<cr>", desc = "Hide package versions" },
      { "<leader>nt", "<cmd>lua require('package-info').toggle()<cr>", desc = "Toggle package versions" },
      { "<leader>nu", "<cmd>lua require('package-info').update()<cr>", desc = "Update package on line" },
      { "<leader>nd", "<cmd>lua require('package-info').delete()<cr>", desc = "Delete package on line" },
      { "<leader>ni", "<cmd>lua require('package-info').install()<cr>", desc = "Install package on line" },
      { "<leader>np", "<cmd>lua require('package-info').change_version()<cr>", desc = "Change package version" },
    },
    opts = {
      colors = {
        up_to_date = "#3C4048",
        outdated = "#fc514e",
      },
      icons = {
        enable = true,
        style = {
          up_to_date = "|  ",
          outdated = "|  ",
        },
      },
      autostart = true,
      hide_up_to_date = false,
      hide_unstable_versions = true,
    },
  },

  -- TypeScript error translation (makes errors readable)
  {
    "dmmulroy/ts-error-translator.nvim",
    ft = { "typescript", "typescriptreact" },
    config = true,
  },

  -- JSX/TSX auto-rename tag pairs
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "vue" },
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
      })
    end,
  },

  -- REST client for API testing (great for fullstack)
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = "http",
    keys = {
      { "<leader>rr", "<cmd>Rest run<cr>", desc = "Run request under cursor" },
      { "<leader>rl", "<cmd>Rest last<cr>", desc = "Re-run last request" },
      { "<leader>rp", "<cmd>Rest preview<cr>", desc = "Preview request" },
    },
    config = function()
      require("rest-nvim").setup({
        result_split_horizontal = false,
        result_split_in_place = false,
        skip_ssl_verification = false,
        encode_url = true,
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          show_url = true,
          show_curl_command = false,
          show_http_info = true,
          show_headers = true,
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            end,
          },
        },
      })
    end,
  },

  -- TypeScript playground in Neovim
  {
    "jose-elias-alvarez/typescript.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "typescript", "typescriptreact" },
    keys = {
      { "<leader>to", "<cmd>TypescriptOrganizeImports<cr>", desc = "Organize imports" },
      { "<leader>tu", "<cmd>TypescriptRemoveUnused<cr>", desc = "Remove unused imports" },
      { "<leader>tf", "<cmd>TypescriptFixAll<cr>", desc = "Fix all" },
      { "<leader>ta", "<cmd>TypescriptAddMissingImports<cr>", desc = "Add missing imports" },
    },
    config = function()
      require("typescript").setup({
        disable_commands = false,
        debug = false,
        go_to_source_definition = {
          fallback = true,
        },
      })
    end,
  },


  -- Tailwind CSS integration (common in TS projects)
  {
    "luckasRanarison/tailwind-tools.nvim",
    ft = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      document_color = {
        enabled = true,
        kind = "inline",
        inline_symbol = "󰝤 ",
      },
      conceal = {
        enabled = false,
      },
    },
  },

  -- Database integration (for fullstack)
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plpgsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    keys = {
      { "<leader>db", "<cmd>DBUIToggle<cr>", desc = "Toggle DBUI" },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_winwidth = 40
    end,
  },
}
