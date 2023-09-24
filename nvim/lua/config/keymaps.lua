local keymap = vim.keymap
local opts = { silent = true, noremap = true }

-- Delete keymaps
pcall(keymap.del, "n", "<c-up>")
pcall(keymap.del, "n", "<c-down")
pcall(keymap.del, "n", "<c-left>")
pcall(keymap.del, "n", "<c-right>")
pcall(keymap.del, "n", "<c-h>")
pcall(keymap.del, "n", "<c-j")
pcall(keymap.del, "n", "<c-k>")
pcall(keymap.del, "n", "<c-l>")

opts.desc = "Delete single character"
keymap.set("n", "x", '"_x', opts)

opts.desc = " Select all text"
keymap.set("n", "<leader>a", "ggVG", opts)
opts.desc = " Cut all text"
keymap.set("n", "<leader>A", "ggVGd", opts)

opts.desc = "󰗼 Quit NVIM"
keymap.set("n", "<leader>qq", "<cmd>qa!<cr>", opts)

opts.desc = " New file"
keymap.set("n", "<leader>n", "<cmd>ene <cr>", opts)
opts.desc = " Save file"
keymap.set({ "i", "x", "n", "s" }, "<c-s>", function()
  vim.cmd("w")
end, opts)

opts.desc = " Lazy"
keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", opts)

opts.desc = " LspInfo"
keymap.set("n", "<leader>cl", "<cmd>LspInfo<cr>", opts)

opts.desc = " spider-w"
keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<cr>", opts)
opts.desc = " spider-e"
keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<cr>", opts)
opts.desc = " spider-b"
keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<cr>", opts)

opts.desc = " Split Window Verically"
keymap.set("n", "<c-w>\\", "<c-w>v", opts)
opts.desc = " Split Window"
keymap.set("n", "<c-w>-", "<c-w>s", opts)
