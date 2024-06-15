return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local none_ok, none_ls = pcall(require, "null-ls")

		if not none_ok then
			return
		end

		none_ls.setup({
			sources = {
				none_ls.builtins.formatting.stylua,
				none_ls.builtins.formatting.black,
				none_ls.builtins.formatting.prettierd.with({
					filetypes = {
						"html",
						"css",
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"markdown",
						"json",
						"yaml",
						"lua",
					},
				}),
				require("none-ls.diagnostics.eslint_d"),
			},
		})
	end,
}
