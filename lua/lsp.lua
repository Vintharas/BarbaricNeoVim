-- <coc.nvim config> Ported from coc.nvim default config
-- because these settings sort of make sense for LSPs in 
-- general.

-- Some lsp servers have issues with backups
vim.opt.backup = false
vim.opt.writebackup = false
-- Having a longer update time leads to noticeable delays
vim.opt.updatetime = 300
-- Reserve space for diagnostic icons
vim.opt.signcolumn = 'yes'
-- </coc.nvim config>

local lsp = require'lsp-zero'
lsp.preset'recommended'

lsp.ensure_installed{
  'tsserver',
  'eslint',
  'sumneko_lua',
}

lsp.nvim_workspace()

lsp.setup()

-- customize diagnostics
vim.diagnostic.config{
  -- include inline virtual text
  virtual_text = true,
}

-- [[
--
-- Mappings for diagnostics:
--
-- * gl: Show diagnostics in a floating window. See :help vim.diagnostic.open_float().
-- * [d: Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev().
-- * ]d: Move to the next diagnostic. See :help vim.diagnostic.goto_next().
-- ]]

-- Additional mappings
-- Add buffer diagnostics to the location list.
vim.keymap.set('n', 'gq', vim.diagnostic.setloclist)

-- Additional vim-cmp plugin config.
local cmp = require'cmp'
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- Use <C-space> to trigger completion
    -- classic Visual Studio :D
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})
