local go = require('go')

go.setup({
  lsp_cfg = {
    on_attach = require('after.plugin.lsp').on_attach({
      fn_format = function()
        require('go.format').goimport()
      end
    }),
  },
  dap_debug = false,
  luasnip = true,
})

-- Setup Autocommand
require('core.autocommands').go.setup()
