-- Plugin: https://github.com/chrisgrieser/nvim-spider
return {
  plugins.editor.repo_spider,
  name = plugins.editor.spider,
  lazy = true,
  opts = {
    skipInsignificantPunctuation = true,
  },
  config = true,
}
