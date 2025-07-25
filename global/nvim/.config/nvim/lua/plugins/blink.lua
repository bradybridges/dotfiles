return {
	{ "L3MON4D3/LuaSnip", keys = {} },
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		config = function()
			require("blink.cmp").setup({
				snippets = { preset = "luasnip" },
				signature = { enabled = true },
				appearance = {
					nerd_font_variant = "mono",
				},
				fuzzy = {
					sorts = {
						function(a, b)
							if (a.client_name == nil or b.client_name == nil) or (a.client_name == b.client_name) then
								return
							end
							return b.client_name == "emmet_ls"
						end,
						"exact",
						"score",
						"sort_text",
					},
				},
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
					providers = {
						cmdline = {
							min_keyword_length = 2,
						},
					},
				},
				cmdline = {
					enabled = true,
					completion = { menu = { auto_show = false } },
					keymap = {
						preset = "default",
					},
				},
				completion = {
					menu = {
						border = nil,
						scrolloff = 1,
						scrollbar = true,
						draw = {
							columns = {
								{ "kind_icon" },
								{ "label", "label_description", gap = 1 },
								{ "kind" },
								{ "source_name" },
							},
						},
					},
					documentation = {
						window = {
							border = nil,
							scrollbar = true,
							winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
						},
						auto_show = true,
						auto_show_delay_ms = 500,
					},
				},
			})

			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
