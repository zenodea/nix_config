return{
  {
    dir = "/Users/zenodeangeli/Documents/claudevim",
    name = "claudevim",
    config = function()
      require("claudevim").setup({
        -- your config options here
      })
    end,
    keys = {
      { "<leader>cp", "<cmd>ClaudePopup<cr>", desc = "Toggle Claude popup" },
      { "<leader>cs", "<cmd>ClaudeSidebar<cr>", desc = "Toggle Claude sidebar" },
      { "<leader>cc", "<cmd>ClaudeSend<cr>", desc = "Send to Claude", mode = {"n", "v"} },
      { "<leader>ca", "<cmd>ClaudeAsk<cr>", desc = "Ask Claude" },
      { "<leader>cf", "<cmd>ClaudeFile<cr>", desc = "Send file to Claude" },
    },
  }
}
