return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		local colorizer_ok, colorizer = pcall(require, 'colorizer')

		if not colorizer_ok then return end

		colorizer.setup()
	end
}

