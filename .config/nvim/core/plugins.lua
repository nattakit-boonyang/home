local api = vim.api
local fn = vim.fn

local ensure_packer = function()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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

	-- Search and diagnostic navigator
	use({
		'glepnir/lspsaga.nvim',
		branch = 'main',
	})

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
	use { 'windwp/nvim-autopairs' }
	use { 'windwp/nvim-ts-autotag' }
end)

if packer_bootstrap then
	packer.sync()
else
	local status, _ = pcall(require, 'plugin/packer_compiled')
	if not status then
		notify.error('File packer_compiled.lua not found: run PackerSync to fix!')
	end
end

