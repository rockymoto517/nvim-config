require("mason-tool-installer").setup({
	ensure_installed = {
		"lua-language-server",
		"clang-format",
		"clangd",
		"prettier",
		"stylua",
	},
})

