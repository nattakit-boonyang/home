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
  -- Plugin Cache
  use 'lewis6991/impatient.nvim'

  -- Plugin Manager
  use 'wbthomason/packer.nvim'

  -- Colorscheme
  use 'Mofiqul/dracula.nvim'
  use 'shaunsingh/solarized.nvim'
  use 'morhetz/gruvbox'

  -- Builtin LSP Config
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'j-hui/fidget.nvim' },

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

  -- Code Object
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
  use 'nvim-treesitter/playground'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
  }
  use {
    'LukasPietzschmann/telescope-tabs',
    requires = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require 'telescope-tabs'.setup({})
    end
  }
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- Status line
  use 'nvim-lualine/lualine.nvim'
  use 'arkav/lualine-lsp-progress'

  -- Toggle Comment
  use 'numToStr/Comment.nvim'

  -- Match Pairs
  use 'tpope/vim-surround'

  -- Mappings Guide
  use 'folke/which-key.nvim'

  -- Todo Highlight
  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup({})
    end,
  }

  -- Diagnostic Navigator
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup({})
    end
  }

  -- Notify GUI
  use 'rcarriga/nvim-notify'

  -- Indent Highlight
  use 'lukas-reineke/indent-blankline.nvim'

  -- Display Buffer
  use {
    'akinsho/bufferline.nvim',
    tag = 'v3.*',
  }

  -- Git
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'

  -- Enable Repeat Dot for Surround
  use 'tpope/vim-repeat'

  -- Auto Add Pairs
  use 'windwp/nvim-autopairs'
  use {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup({})
    end,
  }

  -- Undo Explorer
  use 'mbbill/undotree'

  -- File Explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly',
  }

  -- Move Line
  use 'fedepujol/move.nvim'

  -- Golang
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'

  -- UI Improvement
  use 'stevearc/dressing.nvim'

  -- Terminal Management
  use {
    'akinsho/toggleterm.nvim',
    tag = '*',
  }

  -- Tmux
  use 'aserowy/tmux.nvim'
  use 'tmux-plugins/vim-tmux'

  -- Camel and Snake Case
  use 'bkad/CamelCaseMotion'

  -- Editconfig
  use 'editorconfig/editorconfig-vim'

  -- Dashboard
  use 'glepnir/dashboard-nvim'
end)

if packer_bootstrap then
  packer.sync()
else
  local status_pc = pcall(require, 'plugin.packer_compiled')
  if not status_pc then
    vim.notify('File packer_compiled.lua not found: run PackerSync to fix!')
  end
end
