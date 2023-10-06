return {
	"f-person/git-blame.nvim",
	init = function()
		vim.cmd[[
			let g:gitblame_enabled = 0
		]]
	end,
}
