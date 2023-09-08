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
  local buf_opts = vim.tbl_extend("force", {
    buffer = bufnr,
  }, opts)
  local u = require("util.lsp")
  local map = function(modes, lhs, rhs, desc, has)
    if has and not u.has(bufnr, has) then
      return
    end

    buf_opts.desc = "[LSP] " .. desc
    keymap.set(modes, lhs, rhs, buf_opts)
  end

  map("v", "<leader>cf", function()
    vim.lsp.buf.format({ async = true })
  end, "Code Format", "rangeFormatting")

  map("n", "<leader>cf", function()
    vim.lsp.buf.format({ async = true })
  end, "Code Format", "formatting")

  map("n", "gd", function()
    require("telescope.builtin").lsp_definitions({ reuse_win = true })
  end, "Goto Definition", "definition")
  map("n", "gr", "<cmd>Telescope lsp_references<cr>", "References")
  map("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
  map("n", "gI", function()
    require("telescope.builtin").lsp_implementations({ reuse_win = true })
  end, "Goto Implementation")
  map("n", "gy", function()
    require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
  end, "Goto Tpe Definition")
  map("n", "K", vim.lsp.buf.hover, "Hover")
  map("n", "gK", vim.lsp.buf.signature_help, "Signature Help", "signatureHelp")
  map("i", "<c-k>", vim.lsp.buf.signature_help, "Signature Help", "signatureHelp")
  map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
  map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
  map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action", "codeAction")
  map("n", "<leader>cr", vim.lsp.buf.rename, "Rename", "rename")
end
return M
