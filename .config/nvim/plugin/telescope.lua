local actions = g.loader.load_plugin('telescope.actions')
local trouble = g.loader.load_plugin('trouble.providers.telescope')
local builtin = g.loader.load_plugin('telescope.builtin')
local telescope = g.loader.load_plugin('telescope')

-- Setup
telescope.setup({
	defaults = {
		mappings = {
			i = { ['<c-t>'] = trouble.open_with_trouble },
			n = { ['<c-t>'] = trouble.open_with_trouble },
		},
	},
})

-- Key mappings
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
