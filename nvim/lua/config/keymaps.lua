local keymap = vim.keymap
local opts = { silent = true, noremap = true }

-- Delete keymaps
pcall(keymap.del, "n", "<C-Up>")
pcall(keymap.del, "n", "<C-Down")
pcall(keymap.del, "n", "<C-Left>")
pcall(keymap.del, "n", "<C-Right>")
pcall(keymap.del, "n", "<C-h>")
pcall(keymap.del, "n", "<C-j")
pcall(keymap.del, "n", "<C-k>")
pcall(keymap.del, "n", "<C-l>")

-- Delete single character
opts.desc = "Delete single character"
keymap.set("n", "x", '"_x', opts)

-- Select all text in the buffer
opts.desc = "Select all text"
keymap.set("n", "<leader>a", "ggVG", opts)

-- Save file
opts.desc = "Save file"
keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", opts)

opts.desc = "Lazy"
keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", opts)

local M = {}
M.set_lsp_keymaps = function(bufnr)
  opts.buffer = bufnr

  opts.desc = "Code Format"
  keymap.set("n", "<leader>cf", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
end
return M
