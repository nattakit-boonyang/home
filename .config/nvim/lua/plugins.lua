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
local packer = require('packer')

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'lewis6991/impatient.nvim'

  use 'Mofiqul/dracula.nvim'

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/nvim-treesitter-context'
  use {
    'andymass/vim-matchup',
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    end
  }
  use 'p00f/nvim-ts-rainbow'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
  }

  use 'nvim-lualine/lualine.nvim'

  use 'numToStr/Comment.nvim'

  use 'tpope/vim-surround'

  use 'folke/which-key.nvim'

  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup({})
    end,
  }

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup({})
    end
  }

  use 'rcarriga/nvim-notify'

  use 'lukas-reineke/indent-blankline.nvim'

  use {
    'akinsho/bufferline.nvim',
    tag = 'v3.*',
  }

  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'

  use 'tpope/vim-repeat'

  use 'windwp/nvim-autopairs'
  use {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup({})
    end,
  }

  use 'mbbill/undotree'

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly',
  }
end)

if packer_bootstrap then
  packer.sync()
else
  local status_pc = pcall(require, 'plugin.packer_compiled')
  if not status_pc then
    vim.notify('File packer_compiled.lua not found: run PackerSync to fix!')
  end
end
