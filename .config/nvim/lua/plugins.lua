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
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Cache plugins
  use 'lewis6991/impatient.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
    requires = 'nvim-treesitter/nvim-treesitter',
  }

  use {
    'nvim-treesitter/nvim-treesitter-context',
    after = 'nvim-treesitter',
    requires = 'nvim-treesitter/nvim-treesitter',
  }

  use 'nvim-treesitter/playground'

  -- Colorizer
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  }

  -- Github copilot (alternative)
  use {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  }

  use {
    'zbirenbaum/copilot-cmp',
    after = { 'copilot.lua' },
    config = function()
      require('copilot_cmp').setup()
    end
  }

  -- Golang
  use {
    'ray-x/go.nvim',
    config = function()
      require('go').setup()
    end,
  }
  use {
    'ray-x/guihua.lua',
    requires = 'go.nvim',
  }

  -- File explorer
  use 'nvim-tree/nvim-tree.lua'

  -- File trimer
  use {
    'cappyzawa/trim.nvim',
    config = function()
      require('trim').setup({
        patterns = {
          [[%s/\(\n\n\)\n\+/\1/]],
        },
      })
    end,
  }

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup()
    end,
  }

  -- Manipulate match pairs
  use {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup()
    end
  }

  -- Mappings helper
  use 'folke/which-key.nvim'

  -- Indent lines
  use 'lukas-reineke/indent-blankline.nvim'

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      {
        'j-hui/fidget.nvim',
        tag = 'legacy',
      },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'L3MON4D3/LuaSnip' },
    },
  }

  -- Comments
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- Bufferline
  use {
    'akinsho/bufferline.nvim',
    tag = '*',
    requires = 'nvim-tree/nvim-web-devicons',
  }

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  }
  use 'tpope/vim-fugitive'

  -- Enable Repeat Dot for Surround
  use 'tpope/vim-repeat'

  -- Markdown preview
  use {
    'iamcco/markdown-preview.nvim',
    setup = function() vim.g.mkdp_filetypes = { 'markdown' } end,
    ft = { 'markdown' },
  }

  -- Signature helper
  use {
    'ray-x/lsp_signature.nvim',
  }

  -- Auto pairs
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  }

  use 'windwp/nvim-ts-autotag'

  -- Tmux
  use {
    'aserowy/tmux.nvim',
    config = function()
      require('tmux').setup({
        copy_sync = {
          enable = false,
        },
        navigation = {
          enable_default_keybindings = true,
        },
      })
    end,
  }
  use 'tmux-plugins/vim-tmux'

  -- Motion
  use 'bkad/CamelCaseMotion'

  -- Pretty diagnostics
  use {
    'folke/trouble.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
  }

  -- Symbol outline
  use 'simrat39/symbols-outline.nvim'

  -- Rest API testing
  use 'rest-nvim/rest.nvim'

  -- Automatically sync plugins
  if packer_bootstrap then
    packer.sync()
  end
end)
