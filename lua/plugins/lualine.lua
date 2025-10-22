return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		theme = "sonokai",
		sections = {
			lualine_y = { "require('arrow.statusline').text_for_statusline_with_icons()" },
		},
	},
}
