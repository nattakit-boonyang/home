local api = vim.api

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require("go.format").goimport()
  end,
  group = api.nvim_create_augroup("GoFormat", {}),
})
