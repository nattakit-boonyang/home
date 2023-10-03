-- Plugin: https://github.com/iamcco/markdown-preview.nvim
-- no alias name for fix start directory path
return {
  plugins.lsp.repo_markdown_preview,
  ft = { "markdown" },
  build = "cd app && ./install.sh",
  config = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
}
