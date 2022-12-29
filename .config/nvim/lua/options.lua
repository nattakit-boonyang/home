local g = vim.g
local opt = vim.opt

-- Editor
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.mapleader = ' '
opt.timeoutlen = 0
opt.number = true
opt.relativenumber = true
opt.numberwidth = 4
opt.signcolumn = 'yes'

-- Folding
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevel = 999
opt.foldenable = true

-- Filetype
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

-- Indentation
opt.expandtab = true
opt.breakindent = true
opt.smarttab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.autoindent = true
opt.smartindent = true
opt.backspace = 'start,eol,indent'

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.showmatch = true
opt.ignorecase = true
opt.smartcase = true
opt.iskeyword:append('-')

-- Command
opt.hidden = true
opt.showcmd = true
opt.showmode = true
opt.cmdheight = 1
opt.backup = false
opt.swapfile = false

-- Window
opt.splitbelow = true
opt.splitright = true
opt.visualbell = true
opt.errorbells = true
opt.title = true
opt.laststatus = 3
opt.clipboard:append('unnamedplus')
opt.wrap = false
opt.list = false
opt.listchars = {
  tab = '▸\\ ',
  lead = '␣',
  trail = '␣',
  precedes = '❮',
  extends = '❯',
  eol = '↴',
}

-- Cursor
opt.cursorline = true
opt.termguicolors = true
opt.winblend = 0
opt.wildoptions = 'pum'
opt.pumblend = 5
opt.background = 'dark'
