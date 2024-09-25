return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").setup()
	end,
}
