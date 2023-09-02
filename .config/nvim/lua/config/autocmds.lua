local api = vim.api

vim.api.nvim_create_user_command("DetectBackground", function()
  local cmd = "silent !/usr/bin/defaults read -g AppleInterfaceStyle"
  local _, ok = pcall(vim.api.nvim_command, cmd)
  if ok then
    vim.opt.background = "dark"
  else
    vim.opt.background = "light"
  end
end, {})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = api.nvim_create_augroup("GoFormat", { clear = true }),
  pattern = "*.go",
  callback = function()
    require("go.format").goimport()
  end,
})
