local api = vim.api

vim.api.nvim_create_autocmd("BufWritePre", {
  group = api.nvim_create_augroup("GoFormat", { clear = true }),
  pattern = "*.go",
  callback = function()
    require("go.format").goimport()
  end,
})
