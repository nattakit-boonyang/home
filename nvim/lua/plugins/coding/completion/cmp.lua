-- Plugin: https://github.com/hrsh7th/nvim-cmp
return {
  plugins.coding.completion.repo_cmp,
  name = plugins.coding.completion.cmp,
  event = "InsertEnter",
  dependencies = {
    {
      -- Plugin: https://github.com/zbirenbaum/copilot-cmp
      plugins.coding.completion.sources.repo_copilot_cmp,
      name = plugins.coding.completion.sources.copilot_cmp,
      dependencies = plugins.coding.completion.copilot,
      config = true,
    },
    {
      -- Plugin: https://github.com/hrsh7th/cmp-nvim-lsp
      plugins.coding.completion.sources.repo_lsp_cmp,
      name = plugins.coding.completion.sources.lsp_cmp,
    },
    {
      -- Plugin: https://github.com/saadparwaiz1/cmp_luasnip
      plugins.coding.completion.sources.repo_luasnip_cmp,
      name = plugins.coding.completion.sources.luasnip_cmp,
    },
    {
      -- Plugin: https://github.com/hrsh7th/cmp-path
      plugins.coding.completion.sources.repo_path_cmp,
      name = plugins.coding.completion.sources.path_cmp,
    },
    {
      -- Plugin: https://github.com/hrsh7th/cmp-cmdline
      plugins.coding.completion.sources.repo_cmdline_cmp,
      name = plugins.coding.completion.sources.cmdline_cmp,
    },
    {
      -- Plugin: https://github.com/f3fora/cmp-spell
      plugins.coding.completion.sources.repo_spell_cmp,
      name = plugins.coding.completion.sources.spell_cmp,
    },
    {
      -- Plugin: https://github.com/hrsh7th/cmp-buffer
      plugins.coding.completion.sources.repo_buffer_cmp,
      name = plugins.coding.completion.sources.buffer_cmp,
    },
    plugins.coding.completion.luasnip,
    plugins.coding.completion.friendly_snippets,
    plugins.coding.completion.lspkind,
  },
  config = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

    local cmp = require("cmp")
    local ls = require("luasnip")
    local lspkind = require("lspkind")

    require("luasnip.loaders.from_vscode").lazy_load()

    local opts = { silent = true, noremap = true }
    vim.keymap.set({ "i" }, "<c-k>", function() ls.expand() end, opts)
    vim.keymap.set({ "i", "s" }, "<c-l>", function() ls.jump(1) end, opts)
    vim.keymap.set({ "i", "s" }, "<c-h>", function() ls.jump(-1) end, opts)
    vim.keymap.set({ "i", "s" }, "<c-e>", function()
      if ls.choice_active() then ls.change_choice(1) end
    end, opts)

    cmp.setup({
      sources = cmp.config.sources({
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
        { name = "spell" },
      }),
      mapping = cmp.mapping.preset.insert({
        ["<c-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<c-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<c-b>"] = cmp.mapping.scroll_docs(-4),
        ["<c-f>"] = cmp.mapping.scroll_docs(4),
        ["<c-space>"] = cmp.mapping.complete(),
        ["<c-e>"] = cmp.mapping.abort(),
        ["<cr>"] = cmp.mapping.confirm({ select = true }),
        ["<s-cr>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
      }),
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          ls.lsp_expand(args.body)
        end,
      },
      window = {
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = '...',
          symbol_map = icons.lspkind,
        }),
      },
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
    })

    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      })
    })
  end,
}
