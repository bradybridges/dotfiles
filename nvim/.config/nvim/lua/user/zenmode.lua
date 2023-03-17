local status, zenMode = pcall(require, "zen-mode")
if not status then
	return
end

zenMode.setup({
	window = {
		width = 1,
		height = 1,
	},
})
