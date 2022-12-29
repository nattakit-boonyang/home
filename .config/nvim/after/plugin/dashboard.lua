local db = require('dashboard')

db.custom_center = {
  { icon = '  ',
    desc = '[R]ecently opened [f]iles                   ',
    action = 'Telescope oldfiles',
    shortcut = '<leader> f r' },
  { icon = '  ',
    desc = '[F]ind  [F]ile                              ',
    action = 'Telescope find_files find_command=rg,--hidden,--files',
    shortcut = '<leader> f f' },
  { icon = '  ',
    desc = '[F]ile [B]rowser                            ',
    action = 'Telescope file_browser',
    shortcut = '<leader> f B' },
  { icon = '  ',
    desc = '[F]ind  [G]rep                              ',
    action = 'Telescope live_grep',
    shortcut = '<leader> f g' },
}
