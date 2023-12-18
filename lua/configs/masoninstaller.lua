require("mason-tool-installer").setup({
	ensure_installed = {
		"lua-language-server",
		"isort",
		"black",
		"clang-format",
		"clangd",
		"prettier",
		"pylint",
		"stylua",
	},
})

