local status, tag = pcall(require, 'nvim-ts-autotag')
if not status then return end

tag.setup({})
