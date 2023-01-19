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

local merge = function(a, b)
  return vim.tbl_deep_extend('force', {}, a, b)
end

local lsp = require'lsp-zero'
lsp.preset'recommended'

-- disable default keymaps so we can customize them
lsp.set_preferences{
  set_lsp_keymaps = false
}

-- Replace complete on_attach with custom version
lsp.on_attach(function(client, bufnr)
  -- Remap
  -- The main reason for remapping these mappings is that I always, always use K for 5k
  -- and <leader>k for help, hover actions and such.

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('<leader>k', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, { desc = 'Format current buffer with LSP' })

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end)

-- ensure these lsp providers are installed
lsp.ensure_installed{
  'tsserver',
  'eslint',
  'sumneko_lua',
}

-- Additional vim-cmp plugin config.
local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

local cmp = require'cmp'
local luasnip = require 'luasnip'
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- Use <C-space> to trigger completion
    -- classic Visual Studio :D
    ['<C-Space>'] = cmp.mapping.complete(),
    -- when luasnip, expand or jump
    -- when menu is visible, select current item
    -- when line is empty, insert a tab character
    -- else, activate completion
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        -- cmp.select_next_item(select_opts)
        cmp.confirm{select = false}
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_back_space() then
        fallback()
      else
        cmp.complete()
      end
    end, {'i', 's'}),
  }),

  sources = merge(lsp.defaults.cmp_sources(),
    { name = 'dictionary'}),
})


-- nvim-cmp config per filetype
-- one needs to install dictionary files meeeh
--cmp.setup.filetype('markdown', {
  --sources = cmp.config.sources({
    --{ name = 'dictionary' },
  --})
--})
--cmp.setup.filetype('markdown.mdx', {
  --sources = cmp.config.sources({
    --{ name = 'dictionary' },
  --})
--})

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
