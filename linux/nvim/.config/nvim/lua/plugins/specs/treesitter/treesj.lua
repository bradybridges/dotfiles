return {
	"Wansmer/treesj",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local status, tsj = pcall(require, "treesj")

		if not status then
			return
		end

		tsj.setup({
			use_default_keymaps = false,
			max_join_length = 200,
		})
	end,
	dependencies = { "nvim-treesitter/nvim-treesitter" },
}
