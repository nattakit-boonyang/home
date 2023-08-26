local set = vim.keymap.set
local lsp = vim.lsp.buf

local new_opts = function(desc)
  return {
    desc = desc,
    noremap = true,
    silent = true,
  }
end

-- save file
set({ "i", "v", "n", "s" }, "<c-s>", "<cmd>w<cr><esc>", new_opts("Save file"))

set("n", "<leader>lf", "<cmd>LspZeroFormat<cr>", new_opts("Format"))
set("n", "<leader>ln", lsp.rename, new_opts("Rename"))
set({ "n", "v" }, "ga", lsp.code_action, new_opts("Code Action"))
set("n", "gI",
  function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end,
  new_opts("Implementation"))

set("n", "<leader>b", function() require("telescope.builtin").buffers() end, new_opts("Buffers"))

set("n", "<leader>t", "<cmd>TroubleToggle<cr>", new_opts("Trouble"))
set("n", "<leader>k", lsp.signature_help, new_opts("Signature Help"))

set("n", "<leader>ee", "<cmd>NvimTreeFocus<cr>", new_opts("Explorer Open"))
set("n", "<leader>ed", "<cmd>NvimTreeClose<cr>", new_opts("Explorer Close"))
set("n", "<leader>ss", "<cmd>SymbolsOutlineOpen<cr>", new_opts("Symbols Outline Open"))
set("n", "<leader>sd", "<cmd>SymbolsOutlineClose<cr>", new_opts("Symbols Outline Close"))
set("n", "<leader>ff", function() require("telescope.builtin").find_files() end, new_opts("Find Files"))
set("n", "<leader>fg", function() require("telescope.builtin").live_grep() end, new_opts("Live Grep"))

set("n", "<leader>[t", "<cmd>tabprev<cr>", new_opts("Previous Tab"))
set("n", "<leader>]t", "<cmd>tabnext<cr>", new_opts("Next Tab"))
set("n", "<leader>[b", "<cmd>bprev<cr>", new_opts("Previous Buffer"))
set("n", "<leader>]b", "<cmd>bnext<cr>", new_opts("Next Buffer"))

set("n", "x", '"_x', new_opts("Delete"))
