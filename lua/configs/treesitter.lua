require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"lua",
		"cpp",
		"python",
		"vim",
		"query",
		"json",
		"yaml",
		"gitignore",
		"bash",
		"markdown",
		"markdown_inline",
		"toml",
	},
	sync_install = false,
	auto_install = true,
	ignore_install = { "javascript" },
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
	},
})

