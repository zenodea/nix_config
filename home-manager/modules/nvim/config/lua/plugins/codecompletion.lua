return {
  {
  "mrcjkb/rustaceanvim",
  version = "^4", -- This will use the latest v2.x.x release
    lazy = false,
  },
{
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter"
  }
}
}
