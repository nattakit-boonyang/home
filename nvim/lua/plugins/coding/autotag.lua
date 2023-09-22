-- Plugin: https://github.com/windwp/nvim-ts-autotag
return {
  plugins.coding.repo_autotag,
  name = plugins.coding.autotag,
  dependencies = plugins.coding.treesitter,
  config = true,
}
