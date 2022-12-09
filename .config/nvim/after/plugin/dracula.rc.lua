local status, n = pcall(require, 'dracula')
if not status then return end

n.setup({
	show_end_of_buffer = true,
	transparent_bg = true,
	italic_comment = true,
})
