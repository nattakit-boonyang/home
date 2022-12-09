local status, packer = pcall(require, 'packer')
if not status then
	print('Packer is not installed')
	return
end

-- Load Packer
vim.cmd [[packadd packer.nvim]]

-- Set dracula theme
vim.cmd [[colorscheme dracula]]

packer.startup(function(use)
	-- Packer itself
	use 'wbthomason/packer.nvim'

	-- Dracula theme
	use 'Mofiqul/dracula.nvim'

	-- Status line
	use({
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	})

	-- Built-in LSP client
	use 'neovim/nvim-lspconfig'

	-- Autocompletion
	use 'hrsh7th/nvim-cmp'
	use 'onsails/lspkind.nvim' -- VSCode pictograms

	-- LSP source
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'

	-- Snippets source
	use 'saadparwaiz1/cmp_luasnip'

	-- Snippets
	use 'L3MON4D3/LuaSnip'

	-- Syntax parser
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'nvim-treesitter/nvim-treesitter-textobjects'

	use 'mfussenegger/nvim-dap'
	use 'rcarriga/nvim-dap-ui'
	use 'theHamsta/nvim-dap-virtual-text'

	-- Support golang
	use 'ray-x/go.nvim'

	-- File tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	use { 'windwp/nvim-autopairs' }
	use { 'windwp/nvim-ts-autotag' }
end)
