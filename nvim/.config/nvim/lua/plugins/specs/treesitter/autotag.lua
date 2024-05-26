return {
	'windwp/nvim-ts-autotag',
	config = function()
		local status_ok, autotag = pcall(require, 'nvim-ts-autotag')

		if not status_ok then return end

		autotag.setup()
	end
}
