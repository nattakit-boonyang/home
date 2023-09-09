-- Plugin: https://github.com/SmiteshP/nvim-navic
return new_plugin(plugins.ui.nvim_navic)
    .load_when_used()
    .set_options(function()
      return {
        separator = " ",
        highlight = true,
        depth_limit = 5,
        icons = icons.cmp_kind,
      }
    end)
    .override({
      init = function()
        vim.g.navic_silence = true
        require("util.lsp").on_attach(function(client, buffer)
          if client.server_capabilities.documentSymbolProvider then
            require("nvim-navic").attach(client, buffer)
          end
        end)
      end,
    })
