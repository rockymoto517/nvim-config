return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	branch = string.find(vim.loop.os_uname().sysname, "Windows") and "windows" or "main",
	config = function()
		local actions = require("fzf-lua.actions")
		require("fzf-lua").setup({
			"telescope",
			actions = {
				files = {
					["ctrl-s"] = actions.file_vsplit,
					["ctrl-q"] = actions.file_split,
					["ctrl-v"] = nil,
				},
			},
		})
		vim.keymap.set("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", { desc = "fuzzy find files" })
		vim.keymap.set("n", "<leader>fg", "<cmd>lua require('fzf-lua').git_files()<CR>", { desc = "fuzzy find git files" })
		vim.keymap.set("n", "<leader>fw", "<cmd>lua require('fzf-lua').live_grep_glob()<CR>", { desc = "fuzzy find grep" })
		vim.keymap.set("v", "<leader>fw", "<cmd>lua require('fzf-lua').grep_visual()<CR>", { desc = "fuzzy find grep visual selection" })
		vim.keymap.set("n", "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<CR>", { desc = "fuzzy find buffers" })
		vim.keymap.set("n", "<leader>fd", "<cmd>lua require('fzf-lua').lsp_declarations()<CR>", { desc = "fuzzy find declarations" })
		vim.keymap.set("n", "<leader>fr", "<cmd>lua require('fzf-lua').lsp_references()<CR>", { desc = "fuzzy find references" })
	end,
}
