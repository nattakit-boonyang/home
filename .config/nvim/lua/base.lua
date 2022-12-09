vim.cmd('autocmd!') -- Executed automatically when rw a file

-- line number
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = 'yes'
vim.wo.number = true

-- file encoding
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split'
vim.scrolloff = 10
vim.opt.path:append { '**' } -- Search file down into sub directories
vim.opt.wildignore:append {}
vim.opt.iskeyword:append('-')

-- indentation
vim.expandtab = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.backspace = 'start,eol,indent'

-- command
vim.opt.shell = 'zsh'
vim.opt.hidden = true
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.backup = false
vim.opt.backupskip = '/tmp/*,/private/tmp/*'

-- windows
vim.opt.title = true
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

-- highlights
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'
