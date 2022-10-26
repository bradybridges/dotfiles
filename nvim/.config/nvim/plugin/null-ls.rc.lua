local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.eslint_d.with({
			diagnostics_format = '[eslint] #{m}\n(#{c})'
		}),
	},
})

local markdownlint = {
	name = "markdownlint",
	method = null_ls.methods.FORMATTING,
	generator = null_ls.formatter({
		command = "markdownlint",
		args = { "--fix", "$FILENAME" },
		-- doesn't support stdin for fixing, but we can use a temp file
		to_temp_file = true,
	}),
	filetypes = { "markdown" },
}

-- register separately or add to other sources
null_ls.register(markdownlint)
