-- return {
-- 	"rose-pine/neovim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	name = "rose-pine",
-- 	config = function()
-- 		require("rose-pine").setup({
-- 			variant = "moon",
-- 			dark_variant = "moon",
-- 			styles = {
-- 				bold = true,
-- 				italic = false,
-- 				transparency = true,
-- 			},
-- 		})
--
-- 		vim.cmd([[colorscheme rose-pine]])
-- 	end,
-- }
return {
	"Skardyy/makurai-nvim",
	config = function()
		require("makurai").setup({
			transparent = true,
		})

		vim.cmd.colorscheme("makurai_autumn")
	end,
}
