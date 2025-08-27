-- Set transparency options
vim.opt.winblend = 0      -- Control per-plugin
vim.opt.pumblend = 80     -- 80% transparent completion menu
vim.opt.termguicolors = true

-- Ensure transparency persists
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Force transparent backgrounds
    local transparent_groups = {
      "Normal", "NormalNC", "NormalFloat", "FloatBorder",
      "CursorLine", "SignColumn", "StatusLine", "StatusLineNC",
      "TabLine", "TabLineFill", "TabLineSel", "WinSeparator"
    }
    
    for _, group in ipairs(transparent_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE" })
    end
    
    -- Additional transparency for completion menu
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "NONE" })
  end,
})
