local cmp = g.loader.load_plugin('cmp')
local luasnip = g.loader.load_plugin('luasnip')
local lspkind = g.loader.load_plugin('lspkind')

vim.cmd [[
	set completeopt=menu,menuone,noselect
	highlight! default link CmpItemKind CmpItemMenuDefault
]]

-- Default completion
local mapping = cmp.mapping

cmp.setup({
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol_text',
			maxwidth = 50,
			menu = {
				nvim_lsp = "[LSP]",
				nvim_lua = "[Lua]",
				path = "[Path]",
				buffer = "[Buffer]",
			},
		}),
	},
	snippet = {
		expand = function(args)
			-- Use a snippet engine (luasnip)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = mapping.preset.insert({
		['<C-b>'] = mapping.scroll_docs(-4),
		['<C-f>'] = mapping.scroll_docs(4),
		['<C-space>'] = mapping.complete(),
		['<C-e>'] = mapping.abort(),
		-- Accept currently selected item.
		['<CR>'] = mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		['<tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
	completion = {
		keyword_length = 1,
		completeopt = "menu,noselect",
	},
	sources = cmp.config.sources(
		{
			{ name = 'nvim-lsp' },
			{ name = 'nvim_lua' },
			{ name = 'luasnip' },
			{ name = 'buffer' },
			{ name = 'path' },
			{ name = 'cmdline' },
		}),
})

-- Use buffer source for `/` and `?`
cmp.setup.cmdline({ '/', '?' }, {
	mapping = mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' },
	},
})

cmp.setup.cmdline(':', {
	mapping = mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' },
		{ name = 'cmdline' },
	}),
})
