return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {},
	dependencies = {
		{ "JoosepAlviste/nvim-ts-context-commentstring" },
	},
	config = function()
		local status_ok, comment = pcall(require, "Comment")
		if not status_ok then
			return
		end

		comment.setup({
			pre_hook = function(ctx)
				local U = require "Comment.utils"

				local utils_ok, ts_utils = pcall(require, 'ts_context_commentstring.utils')

				if not utils_ok then return end

				local location = nil
				if ctx.ctype == U.ctype.block then
					location = ts_utils.get_cursor_location()
				elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
					location = ts_utils.get_visual_start_location()
				end

				local internal_ok, ts_internal = pcall(require, 'ts_context_commentstring.internal')

				if not internal_ok then return end

				return ts_internal.calculate_commentstring {
					key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
					location = location,
				}
			end,
		})
	end
}
