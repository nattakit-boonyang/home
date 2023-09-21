local keymap = vim.keymap
local opts = { silent = true, noremap = true }

-- Delete keymaps
pcall(keymap.del, "n", "<C-up>")
pcall(keymap.del, "n", "<C-down")
pcall(keymap.del, "n", "<C-left>")
pcall(keymap.del, "n", "<C-right>")
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
keymap.set({ "i", "x", "n", "s" }, "<c-s>", "<cmd>w<cr><esc>", opts)

opts.desc = "Lazy"
keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", opts)
