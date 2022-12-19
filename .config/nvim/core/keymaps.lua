local keymap = vim.keymap
local nor = { noremap = true }
local sln = { silent = true }

-- Disable macro
keymap.set('', 'q', '<nop>')

-- Do not yank for press 'x'
keymap.set('n', 'x', '"_x')

-- Delete a word brackwards
keymap.set('n', 'dw', 'vb"_d')

-- Remove arrow keys
keymap.set({ 'n', 'i', 'v' }, '<down>', '<nop>', nor)
keymap.set({ 'n', 'i', 'v' }, '<up>', '<nop>', nor)
keymap.set({ 'n', 'i', 'v' }, '<left>', '<nop>', nor)
keymap.set({ 'n', 'i', 'v' }, '<right>', '<nop>', nor)

-- Remap clear highlighit after searching
keymap.set('n', '<leader>nh', ':nohlsearch<cr>', sln)

-- Remap Nvim Tree
keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>', sln)
