-- https://github.com/iamcco/markdown-preview.nvim
-- TODO: is built using docker
return {
  "iamcco/markdown-preview.nvim",
  event = "LspAttach",
  ft = "markdown",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
}
