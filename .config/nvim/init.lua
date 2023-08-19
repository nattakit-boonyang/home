-- Set package path
package.path = string.format('%s;%s', vim.fn.expand('~/.config/nvim/?.lua'), package.path)

-- Enable package caching
require('impatient')

-- Reset autocmd
vim.cmd [[autocmd!]]

local core_conf_files = {
  'options.lua',
  'plugins.lua',
  'mappings.lua',
  'autocmds.lua',
}

-- source all the core config files
for _, file_name in ipairs(core_conf_files) do
  if vim.endswith(file_name, 'vim') then
    local path = string.format("%s/core/%s", vim.fn.stdpath("config"), file_name)
    local source_cmd = "source " .. path
    vim.cmd(source_cmd)
  else
    local module_name, _ = string.gsub(file_name, "%.lua", "")
    package.loaded[module_name] = nil
    require(module_name)
  end
end
