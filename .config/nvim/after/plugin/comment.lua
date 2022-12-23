-- Plugin for comment keybinding
local comment = require('Comment')

comment.setup({
	padding = true,
	sticky = true,
	toggler = {
		line = 'gcc',
		block = 'gbc',
	},
	opleader = {
		line = 'gc',
		block = 'gb',
	},
	mappings = {
		---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
		basic = true,
		---Extra mapping; `gco`, `gcO`, `gcA`
		extra = true,
	},
})
