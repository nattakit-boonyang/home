-- Line Number
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = 'yes'
vim.wo.number = true

-- File Encoding
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split'
vim.scrolloff = 10
-- Search file down into sub directories
vim.opt.path:append { '**' }
vim.opt.wildignore:append {}
-- Add dash to word matching
vim.opt.iskeyword:append('-')

-- Indentation
vim.expandtab = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.backspace = 'start,eol,indent'

-- Command
vim.opt.shell = 'zsh'
vim.opt.hidden = true
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.backup = false
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.swapfile = false

-- Windows
vim.opt.title = false
vim.opt.laststatus = 2
vim.opt.clipboard:append { 'unnamedplus' }
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = {
	tab = '>\\',
	eol = '$',
	lead = '-',
	trail = '-',
	precedes = '<',
	extends = '>',
}

-- Highlights
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'
