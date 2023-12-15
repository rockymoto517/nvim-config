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

local path = require("path")
local separator = "/"
if path:find("\\") then
	separator = "\\"
end
local stylua = path .. separator .. "formatting" .. separator .. "stylua.toml"
conform.formatters.stylua = {
	prepend_args = { "-f", stylua },
}

vim.keymap.set({ "n", "v" }, "<leader>fmt", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file or visual selection" })

