local wk = require('which-key')
local telescope_builtin = require('telescope.builtin')
local lsp_buf = vim.lsp.buf

wk.register({
  o = {
    name = 'NVim Options',
    h = { ':set hlsearch!<cr>', 'Toggle Highlight Search' },
    w = { ':set wrap!<cr>', 'Toggle Wrap' },
    l = { ':set list!<cr>', 'Toggle List' },
    p = { ':set paste!<cr>', 'Toggle Paste' },
  },
  l = {
    name = 'LSP Capabilities',
    f = { ':LspZeroFormat<cr>', 'Format' },
    n = { lsp_buf.rename, 'Rename' },
    a = { lsp_buf.code_action, 'Code Action' },
    i = { telescope_builtin.lsp_implementations, 'Implementation' },
    l = { telescope_builtin.lsp_document_symbols, 'Document Symbol' },
  },
  t = { ':TroubleToggle<cr>', 'Diagnostics' },
  n = {
    name = 'Explorer',
    n = { ':NvimTreeFocus<cr>', 'NvimTreeOpen' },
    m = { ':NvimTreeClose<cr>', 'NvimTreeClose' },
    s = { ':SymbolsOutlineOpen<cr>', 'SymbolsOutlineOpen' },
    d = { ':SymbolsOutlineClose<cr>', 'SymbolsOutlineClose' },
  },
  b = { telescope_builtin.buffers, 'Buffers' },
  f = {
    name = 'Finder',
    f = { telescope_builtin.find_files, 'Find Files' },
    g = { telescope_builtin.live_grep, 'Live Grep' },
    h = { telescope_builtin.help_tags, 'Help Tags' },
  },
}, { mode = 'n', silent = true, noremap = true, prefix = '<leader>' })

wk.register({
  ['g?'] = { '<cmd>WhichKey<cr>', 'Whichkey Mappings' },
  x = { '"_x', 'Delete without yanking' },
  ['['] = {
    name = '[Prev',
    t = { ':tabprev<cr>', 'Tab' },
    b = { ':bprev<cr>', 'Buffer' },
  },
  [']'] = {
    name = 'Next]',
    t = { ':tabnext<cr>', 'Tab' },
    b = { ':bnext<cr>', 'Buffer' },
  },
}, { mode = 'n', silent = true, noremap = true })
