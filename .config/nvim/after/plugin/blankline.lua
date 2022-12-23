local indent = require('indent_blankline')

local colors = {
  '#E06C75',
  '#E5C07B',
  '#98C379',
  '#56B6C2',
  '#61AFEF',
  '#C678DD',
}

local char_highlight_list = {}

for i, color in ipairs(colors) do
  local name = string.format('IndentBlanklineIndent%d', i)
  table.insert(char_highlight_list, name)
  vim.cmd(string.format('highlight %s guifg=%s gui=nocombine', name, color))
end

indent.setup({
  show_current_context = true,
  show_current_context_start = true,
  char_highlight_list = char_highlight_list,
})
