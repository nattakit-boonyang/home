local ensure_packer = function()
	local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

local status, packer = pcall(require, 'packer')
if not status then return end

packer.startup(function(use)
	-- Packer Itself
	use 'wbthomason/packer.nvim'

	-- Dracula Theme
	use 'Mofiqul/dracula.nvim'

	-- Icons
	use 'kyazdani42/nvim-web-devicons'

	-- Built-in LSP client
	use 'neovim/nvim-lspconfig'

	-- LSP server management
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

	-- Autocompletion
	use 'hrsh7th/nvim-cmp'
	-- VSCode Pictograms
	use 'onsails/lspkind.nvim'

	-- LSP Source
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-nvim-lua'

	-- Snippets Source
	use 'saadparwaiz1/cmp_luasnip'

	-- Snippets
	use 'L3MON4D3/LuaSnip'

	-- Status Line
	use 'nvim-lualine/lualine.nvim'

	-- Commentary
	use 'numToStr/Comment.nvim'

	-- Tmux Config Highlight
	use 'tmux-plugins/vim-tmux'

	-- Replace pairs
	use 'tpope/vim-surround'

	-- Syntax Highlight
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
	}

	-- Syntax Parser
	use 'nvim-treesitter/nvim-treesitter-textobjects'

	-- File Tree List
	use {
		'nvim-tree/nvim-tree.lua',
		tag = 'nightly',
	}

	-- Bracket Pairs
	use 'windwp/nvim-autopairs'
	use 'windwp/nvim-ts-autotag'

	-- DAP
	use 'mfussenegger/nvim-dap'

	-- Fuzzy Finder
	use 'nvim-lua/plenary.nvim'
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
	}
	-- Diagnostic integrate with Telescope
	use 'folke/trouble.nvim'

	-- Diagnostic/Code Actions Injector
	use 'jose-elias-alvarez/null-ls.nvim'

	-- Repeat surround by dot
	use 'tpope/vim-repeat'

	-- Support golang
	use 'ray-x/go.nvim'
	use 'ray-x/guihua.lua' -- recommanded if need floating window support

	-- Git
	use 'lewis6991/gitsigns.nvim'
	use 'tpope/vim-fugitive'
end)

if packer_bootstrap then
	packer.sync()
else
	local status_pc = pcall(require, 'plugin/packer_compiled')
	if not status_pc then
		notify.error('File packer_compiled.lua not found: run PackerSync to fix!')
	end
end
