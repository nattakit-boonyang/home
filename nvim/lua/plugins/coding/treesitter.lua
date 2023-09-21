-- Plugin: https://github.com/nvim-treesitter/nvim-treesitter
return {
  plugins.coding.repo_treesitter,
  name = plugins.coding.treesitter,
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  opts = {
    ensure_installed = "all",
    highlight = {
      enable = true,
      disable = {},
      additional_vim_regex_highlighting = false,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
