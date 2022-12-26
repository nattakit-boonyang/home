local toggleterm = require('toggleterm')
local term = require('toggleterm.terminal').Terminal

toggleterm.setup({
  size = 20,
  direction = 'horizontal',
  float_opts = {
    border = 'curved',
    winblend = 0,
  },
  open_mapping = [[<c-]>]],
})

-- Setup Autocommand
require('core.autocommands').term.setup()

-- Setup lazy term
local new_term = function(cmd)
  return term:new({
    cmd = cmd,
    direction = 'float',
    hidden = true,
    close_on_exit = false,
  })
end
