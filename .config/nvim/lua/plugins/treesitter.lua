-- https://github.com/nvim-treesitter/nvim-treesitter
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = "maintained",
    autotag = {
      enable = true,
    },
    playground = {
      enable = true,
    },
    highlight = {
      enable = true,
      disable = {},
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
      disable = {},
    },
    rainbow = {
      enable = true,
      extended_mode = true,
    },
    matchup = {
      enable = true,
    },
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
}
