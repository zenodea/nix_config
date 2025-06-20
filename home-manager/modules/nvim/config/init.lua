-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require('neotest').setup({
  log_level = vim.log.levels.DEBUG,
  adapters = {
    require('rustaceanvim.neotest'), -- Use rustaceanvim's built-in adapter
  },
  output = {
    enabled = true,
    open_on_run = true,
  },
  summary = {
    enabled = true,
    animated = true,
    follow = true,
  },
})

-- After your neotest setup
local neotest = require('neotest')

vim.keymap.set('n', '<leader>tn', neotest.run.run, { desc = 'Run nearest test' })
vim.keymap.set('n', '<leader>tf', function() neotest.run.run(vim.fn.expand('%')) end, { desc = 'Run current file tests' })
vim.keymap.set('n', '<leader>ts', neotest.summary.toggle, { desc = 'Toggle test summary' })
vim.keymap.set('n', '<leader>to', neotest.output.open, { desc = 'Open test output' })
vim.keymap.set('n', '<leader>tp', neotest.output_panel.toggle, { desc = 'Toggle output panel' })

