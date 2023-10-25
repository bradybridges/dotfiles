return {
	"Wansmer/treesj",
	config = function()
		local status, tsj = pcall(require, "treesj")

		if not status then
			return
		end

		tsj.setup()
	end,
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	event = "VeryLazy",
}
