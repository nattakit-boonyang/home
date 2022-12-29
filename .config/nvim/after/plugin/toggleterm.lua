local term = require('toggleterm.terminal').Terminal

-- Setup lazy term
local new_term = function(cmd)
  return term:new({
    cmd = cmd,
    direction = 'float',
    hidden = true,
    close_on_exit = true,
    on_open = function()
      -- Setup Autocommand
      require('autocommands').term.setup()
    end,
  })
end

local new_cmd = function(cmd)
  return function()
    new_term(cmd):toggle()
  end
end

return {
  new_cmd = new_cmd,
}
