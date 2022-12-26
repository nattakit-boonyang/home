local pp = vim.pretty_print
local api = vim.api
local cmd_name = 'TestCmd'
local wk = require('which-key')

local valid_buf_chan = function(bufnr)
  return function(chan)
    return not (chan.buffer == bufnr) and (chan.mode == 'terminal')
  end
end

local send_command = function(cmd)
  local name = 'chan_id_selector'
  local bufnr = vim.api.nvim_get_current_buf()
  local status, chan_selector = pcall(api.nvim_buf_get_var, bufnr, name)
  if status then
    local chan = api.nvim_get_chan_info(chan_selector)
    local is_valid = valid_buf_chan(bufnr)
    if is_valid(chan) then
      api.nvim_chan_send(chan.id, cmd)
      return
    else
      pcall(api.nvim_buf_del_var, bufnr, name) -- Safe to delete variable
    end
  end

  -- Filter channels
  local chans = vim.tbl_filter(valid_buf_chan(bufnr), api.nvim_list_chans())

  -- Check terminal windows not found
  if vim.tbl_count(chans) == 0 then
    vim.notify('Terminal windows not found!', vim.log.levels.ERROR, { title = 'Terminal' })
    return
  end

  -- Convert list to string
  local list = {}
  for _, chan in ipairs(chans) do
    table.insert(list, string.format('%d: bufnr=%d, argv[%s]', chan.id, chan.buffer, table.concat(chan.argv, ' ')))
  end

  -- Select channels if not set
  vim.ui.select(list, {
    prompt = 'Select Terminal',
  }, function(chan)
    if chan == nil then return end

    local chan_id = chan:gsub(':(.+)', '')
    local id = tonumber(chan_id)

    api.nvim_buf_set_var(bufnr, name, id)
    api.nvim_chan_send(id, cmd)
  end)
end

wk.register({
  t = {
    c = { function() send_command('echo hello\n') end, 'Send Command' },
  },
}, {
  mode = 'n',
  noremap = true,
  silent = true,
  prefix = '<leader>',
})

api.nvim_create_user_command(cmd_name, function(opts)
  -- local args = { a = true, b = false }
  -- pp(args)
  -- pp(unpack(args))
  -- pp(vim.tbl_extend('force', args, { a = false }))
  -- vim.ui.input('input', function(input)
  --   vim.notify(input)
  -- end)
  -- local s = require('nvim-treesitter.textobjects.select')
  -- vim.pretty_print(s.select_textobject('@function.inner', 'n'))
  -- vim.pretty_print(s)
  -- end)
end, {})
