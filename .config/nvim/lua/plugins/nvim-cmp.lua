-- https://github.com/hrsh7th/nvim-cmp
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- https://github.com/onsails/lspkind.nvim
    { "onsails/lspkind.nvim" },
  },
  config = function()
    local lspkind = require("lspkind")
    local cmp = require('cmp')

    cmp.setup({
      mapping = {
        ["<Tab>"] = cmp.mapping.confirm({ select = false }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      },
      sources = {
        { name = "copilot",  group_index = 1 },
        { name = "nvim_lsp", group_index = 1 },
        { name = "nvim_lua", group_index = 1 },
        { name = "path",     group_index = 1 },
        { name = "buffer",   group_index = 1 },
        { name = "luasnip",  group_index = 1 },
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
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
          preset = 'codicons',
          ellipsis_char = '...',
          before = function(_, vim_item)
            return vim_item
          end,
          symbol_map = {
            Copilot = "",
            Text = "󰉿",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰜢",
            Variable = "󰀫",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "󰑭",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "󰈇",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "󰙅",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "",
          }
        })
      },
    })
  end,
}
