local status, cin = pcall(require, 'cinnamon')

if (not status) then return end

cin.setup({
	extra_keymaps = true,
	override_keymaps = true,
	max_length = 500,
	scroll_limit = -1,
})
