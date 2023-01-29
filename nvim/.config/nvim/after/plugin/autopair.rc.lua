local status, autopairs, cmp_autopairs, cmp = pcall(function()
	return require "nvim-autopairs",
		require "nvim-autopairs.completion.cmp",
		require "cmp"
end)

if (not status) then return end

-- make autopairs and completion work together
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

autopairs.setup({
	check_ts = true, -- enable treesitter
	disable_filetype = { "TelescopePrompt", "vim" },
	ts_config = {
		lua = { "string" }, -- don't add pairs in lua string treesitter nodes
		javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
	},
})
