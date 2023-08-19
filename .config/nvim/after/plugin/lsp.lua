local lsp = require('lsp-zero').preset('recommended')
local cmp = require('cmp')

-- Lsp Status
require('fidget').setup({
  lsp_status = true,
})

cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping.confirm({ select = false }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  },
  sources = {
    { name = 'copilot',  group_index = 1 },
    { name = 'nvim_lsp', group_index = 1 },
    { name = 'nvim_lua', group_index = 1 },
    { name = 'path',     group_index = 1 },
    { name = 'buffer',   group_index = 1 },
    { name = 'luasnip',  group_index = 1 },
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.kind,
      cmp.config.compare.recently_used,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
})

-- Custom config for lua_ls
require('lspconfig').lua_ls.setup({
  settings = {
    Lua = {
      format = {
        enable = true,
      },
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          vim.api.nvim_get_runtime_file('', true),
          vim.fn.expand('$VIMRUNTIME/lua'),
          vim.fn.expand('$MYVIMRC'),
          vim.fn.stdpath('config'),
          vim.fn.stdpath('config') .. '/lua',
        },
        maxPreload = 2000,
        preloadFileSize = 50000,
      },
      telemetry = {
        enable = false,
      },
    },
  }
})

lsp.nvim_workspace({
  library = vim.api.nvim_get_runtime_file('', true)
})

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

lsp.ensure_installed({
  'gopls',
  'bashls',
  'marksman',
  'tsserver',
  'rust_analyzer',
  'cssls',
  'dockerls',
  'jsonls',
  'eslint',
  'html',
  'lua_ls',
  'yamlls',
  'emmet_ls',
})

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp.setup()
