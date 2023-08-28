local opt = vim.opt

vim.g.markdown_recommended_style = 1

opt.spell = true
opt.spelllang = { "en_us" }
opt.backup = false
opt.encoding = "utf-8"
opt.errorbells = true
opt.fileencoding = "utf-8"
opt.foldenable = true
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.hidden = true
opt.iskeyword:append("-")
opt.listchars:append("precedes:❮")
opt.listchars:append("extends:❯")
opt.listchars:append("trail:·")
opt.showcmd = true
opt.showmode = true
opt.swapfile = false
opt.title = true
opt.visualbell = true
