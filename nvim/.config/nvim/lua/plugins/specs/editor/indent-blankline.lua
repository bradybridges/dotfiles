return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local status_ok, ibl = pcall(require, "ibl")
		if not status_ok then
			return
		end

		local hooks_status, hooks = pcall(require, "ibl.hooks")

		if hooks_status then
			hooks.register(hooks.type.ACTIVE, function(bufnr)
				return vim.api.nvim_buf_line_count(bufnr) < 5000
			end)
		end

		ibl.setup({
			exclude = {
				filetypes = { "NvimTree" },
			},
		})
	end,
}
