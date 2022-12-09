local k = vim.keymap

-- Do not yank for press 'x'
k.set('n', 'x', '"_x')

-- Delete a word brackwards
k.set('n', 'dw', 'vb"_d')

-- Select all
k.set('n', '<C-a>', 'gg<S-v>G')

-- New tabs
k.set('n', 'te', ':tabedit<CR>', { silent = true })

-- Remove arrow keys
k.set({ 'n', 'i', 'v' }, '<down>', '<nop>', { noremap = true })
k.set({ 'n', 'i', 'v' }, '<up>', '<nop>', { noremap = true })
k.set({ 'n', 'i', 'v' }, '<left>', '<nop>', { noremap = true })
k.set({ 'n', 'i', 'v' }, '<right>', '<nop>', { noremap = true })

-- Remap up and down
k.set({ 'n', 'v' }, '<C-k>', '<C-u>', { noremap = true })
k.set({ 'n', 'v' }, '<C-j>', '<C-d>', { noremap = true })
