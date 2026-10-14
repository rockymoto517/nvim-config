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
---
-- return {
-- 	"Skardyy/makurai-nvim",
-- 	config = function()
-- 		require("makurai").modify("autumn", {
-- 			normal = "#82aaff",
-- 			blue = "#82aaff",
-- 		})
--
-- 		require("makurai").setup({
-- 			transparent = true,
-- 			increased_contrast = true,
-- 		})
--
-- 		vim.cmd.colorscheme("makurai_autumn")
-- 	end,
-- }
-- return {
-- 	"sainnhe/sonokai",
-- 	config = function()
-- 		vim.g.sonokai_style = "shusia"
-- 		vim.cmd.colorscheme("sonokai")
-- 	end,
-- }
return {
  "Skardyy/makurai-nvim",
  config = function()
    -- you don't have to call setup
    require "makurai".setup({
      transparent = false,               -- removes the bg color
      cursor = false,                    -- rather or not to modify the cursor color too, changes the `Cursor` highlight
      highlight_only_method_def = false, -- when true, highlights only methods definition, not calls
    })

    vim.cmd.colorscheme("makurai_dark")
  end
}
