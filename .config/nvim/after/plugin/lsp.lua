local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.ensure_installed({
  'sumneko_lua',
  'bashls',
  'yamlls',
  'jsonls',
  'dockerls',
  'golangci_lint_ls',
  'graphql',
  'html',
  'marksman',
  'sqlls',
  'lemminx',
})
lsp.set_preferences({
  set_lsp_keymaps = false,
})
lsp.nvim_workspace({
  library = vim.api.nvim_get_runtime_file('', true)
})
lsp.configure('sumneko_lua', {
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

local api = vim.api
local on_attach = function(opts)
  return function(client, bufnr)
    api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    if client.server_capabilities.documentFormattingProvider then
      require('autocommands').lsp.auto_format(opts.fn_format, bufnr)
    end

    -- set mappings
    require('mappings').lsp.register_mappings(client, bufnr, opts)
  end
end

lsp.on_attach(on_attach({
  fn_format = function(bufnr)
    vim.lsp.buf.format({ async = true, bufnr = bufnr })
  end,
}))

lsp.setup()

-- Turn on lsp status information
require('fidget').setup()

return {
  on_attach = on_attach, -- Export for external lsp config
}
