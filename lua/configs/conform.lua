local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		cpp = { "clang_format" },
		c = { "clang_format" },
		json = { "prettier" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

local path = require("configs.path")
local stylua = path .. "stylua.toml"
conform.formatters.stylua = {
	prepend_args = { "-f", stylua },
}

local clangformat = path .. ".clang-format"
conform.formatters.clang_format = {
	prepend_args = { "--style=file:" .. clangformat },
}

vim.keymap.set({ "n", "v" }, "<leader>fmt", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file or visual selection" })

