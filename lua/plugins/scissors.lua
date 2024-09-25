return {
	"chrisgrieser/nvim-scissors",
	dependencies = "nvim-telescope/telescope.nvim",
	opts = {
		snippetDir = vim.fn.stdpath("config") .. "/snippets",
	},
	config = function()
		vim.keymap.set("n", "<leader>se", function()
			require("scissors").editSnippet()
		end, { desc = "Edit snippet" })

		vim.keymap.set({ "n", "x" }, "<leader>sa", function()
			require("scissors").addNewSnippet()
		end, { desc = "Add new snippet (or from selected)" })
	end,
}
