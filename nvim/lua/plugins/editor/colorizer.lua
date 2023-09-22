-- Plugin: https://github.com/norcalli/nvim-colorizer.lua
return {
  plugins.editor.repo_colorizer,
  name = plugins.editor.colorizer,
  event = "VeryLazy",
  config = true,
  opts = { '*' },
}
