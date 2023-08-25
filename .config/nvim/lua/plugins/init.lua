return {
  -- https://github.com/bkad/CamelCaseMotion
  { "bkad/CamelCaseMotion" },

  -- https://github.com/tmux-plugins/vim-tmux
  { "tmux-plugins/vim-tmux" },

  -- https://github.com/windwp/nvim-autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- https://github.com/folke/which-key.nvim
  {
    "folke/which-key.nvim",
    name = "which-key",
    config = true,
  },

  -- https://github.com/tpope/vim-repeat
  { "tpope/vim-repeat" },

  -- https://github.com/numToStr/Comment.nvim
  {
    "numToStr/Comment.nvim",
    name = "comment",
    config = true,
  },

  -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  -- https://github.com/nvim-treesitter/nvim-treesitter-context
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  -- https://github.com/nvim-treesitter/playground
  {
    "nvim-treesitter/playground",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  -- https://github.com/windwp/nvim-ts-autotag
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  -- https://github.com/norcalli/nvim-colorizer.lua
  { "norcalli/nvim-colorizer.lua" },

  -- https://github.com/ray-x/guihua.lua
  {
    "ray-x/guihua.lua",
    dependencies = "go",
  },

  -- https://github.com/ray-x/lsp_signature.nvim
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    dependencies = "lsp-zero",
    config = true,
  }
}
