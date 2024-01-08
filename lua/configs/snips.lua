vim.keymap.set("n", "<leader>se", function()
	require("scissors").editSnippet()
end, { desc = "Edit snippet" })

vim.keymap.set({ "n", "x" }, "<leader>sa", function()
	require("scissors").addNewSnippet()
end, { desc = "Add new snippet (or from selected)" })

