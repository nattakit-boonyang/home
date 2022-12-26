-- Presets
local colors = {
  dark = {
    color = 'dracula',
    lualine = 'dracula-nvim',
  },
  light = {
    color = 'gruvbox',
    lualine = 'gruvbox',
  },
}

local detect_background = function()
  local background = 'dark'
  if vim.fn.executable('defaults') then
    local cmd = [[!defaults read -g AppleInterfaceStyle]]
    local scripts = vim.api.nvim_command_output(cmd)
    if not scripts:match('Dark') then
      background = 'light'
    end
  end
  return background
end

local color = function()
  local name = 'theme_colors'
  local status, g_colors = pcall(vim.api.nvim_get_var, name)
  if status then
    -- Found in cache
    return g_colors
  end

  -- New detect and set values
  local background = detect_background()

  -- Set background
  vim.opt.background = background
  vim.cmd(string.format('colorscheme %s', colors[background].color))

  vim.api.nvim_set_var(name, colors[background])
  return vim.api.nvim_get_var(name)
end

return {
  color = color(),
}
