return {
	"danymat/neogen",
	config = true,
	version = "*",
	init = function()
		require("neogen").setup({
			enabled = true,
			snippet_engine = "luasnip",
			languages = {
				lua = {
					template = {
						annotation_convention = "emmylua",
					},
				},
			},
		})

		local opts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap("n", "<leader>af", ":lua require('neogen').generate({ type = 'func' })<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>ac", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>at", ":lua require('neogen').generate({ type = 'type' })<CR>", opts)
	end,
}
