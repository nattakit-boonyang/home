local keymap = vim.keymap

-- Disable macro
keymap.set('', 'q', '<Nop>')

-- Do not yank for press 'x'
keymap.set('n', 'x', '"_x')

-- Delete a word brackwards
keymap.set('n', 'dw', 'vb"_d')

-- Remove arrow keys
keymap.set({ 'n', 'i', 'v' }, '<down>', '<nop>', { noremap = true })
keymap.set({ 'n', 'i', 'v' }, '<up>', '<nop>', { noremap = true })
keymap.set({ 'n', 'i', 'v' }, '<left>', '<nop>', { noremap = true })
keymap.set({ 'n', 'i', 'v' }, '<right>', '<nop>', { noremap = true })

-- Remap clear highlighit after searching
keymap.set('n', '<leader>nh', ':nohlsearch<cr>', { silent = true })

-- Remap Nvim Tree
keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>', { silent = true })
