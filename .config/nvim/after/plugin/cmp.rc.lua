local status1, cmp = pcall(require, 'cmp')
if not status1 then return end

local status2, snip = pcall(require, 'luasnip')
if not status2 then return end

local status3, kind = pcall(require, 'lspkind')
if not status3 then return end

local cmap = cmp.mapping

vim.cmd [[
	set completeopt=menu,menuone,noselect
	highlight! default link CmpItemKind CmpItemMenuDefault
]]

-- Default completion
cmp.setup({
	formatting = {
		format = kind.cmp_format({
			mode = 'symbol_text',
			maxwidth = 50,
		}),
	},
	snippet = {
		expand = function(args)
			-- Use a snippet engine (luasnip)
			snip.lsp_expand(args.body)
		end,
	},
	mapping = cmap.preset.insert({
		['<C-b>'] = cmap.scroll_docs(-4),
		['<C-f>'] = cmap.scroll_docs(4),
		['<C-space>'] = cmap.complete(),
		['<C-e>'] = cmap.abort(),
		-- Accept currently selected item.
		['<CR>'] = cmap.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		['<tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif snip.expand_or_jumpable() then
				snip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif snip.jumpable(-1) then
				snip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
	sources = cmp.config.sources(
		{
			{ name = 'nvim-lsp' },
			{ name = 'luasnip' },
			{ name = 'buffer' },
			{ name = 'path' },
			{ name = 'cmdline' },
		}),
})

-- Use buffer source for `/` and `?`
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmap.preset.cmdline(),
	sources = {
		{ name = 'buffer' },
	},
})

cmp.setup.cmdline(':', {
	mapping = cmap.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' },
		{ name = 'cmdline' },
	}),
})
