return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 900,
	opts = {},

	config = function()
		vim.cmd.colorscheme("tokyonight-night")
	end,
}
