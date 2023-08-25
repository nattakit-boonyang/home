-- Globals
local g = vim.g
g.mapleader = " "
g.maplocalleader = " "
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Options
local opt = vim.opt

opt.background = "dark"
opt.timeout = true
opt.timeoutlen = 0
opt.number = true
opt.relativenumber = true
opt.numberwidth = 4
opt.signcolumn = "yes"
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 999
opt.foldenable = true
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.spell = true
opt.spelllang = "en_us"
opt.expandtab = true
opt.breakindent = true
opt.smarttab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.autoindent = true
opt.smartindent = true
opt.backspace = "start,eol,indent"
opt.hlsearch = true
opt.incsearch = true
opt.showmatch = true
opt.ignorecase = true
opt.smartcase = true
opt.iskeyword:append("-")
opt.hidden = true
opt.showcmd = true
opt.showmode = true
opt.cmdheight = 1
opt.backup = false
opt.swapfile = false
opt.cursorline = true
opt.termguicolors = true
opt.winblend = 0
opt.wildoptions = "pum"
opt.pumblend = 5
opt.switchbuf = "useopen"
opt.splitbelow = true
opt.splitright = true
opt.visualbell = true
opt.errorbells = true
opt.title = true
opt.laststatus = 3
opt.clipboard:append("unnamedplus")
opt.wrap = false
opt.list = true
opt.listchars = {
  tab = "▸\\ ",
  lead = "⋅",
  trail = "⋅",
  precedes = "❮",
  extends = "❯",
  -- eol = "↴",
}
