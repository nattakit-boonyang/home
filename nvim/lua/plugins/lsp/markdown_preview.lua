-- Plugin: https://github.com/iamcco/markdown-preview.nvim
return new_plugin(plugins.lsp.markdown_preview).no_setup().is_filetype("markdown").override({
  setup = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
})
