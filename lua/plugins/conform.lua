return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				cpp = { "clang_format" },
				c = { "clang_format" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})

		local path = require("path")
		local stylua = path .. "stylua.toml"
		conform.formatters.stylua = {
			prepend_args = { "-f", stylua },
		}

		local clangformat = path .. ".clang-format"
		conform.formatters.clang_format = {
			prepend_args = { "--style=file:" .. clangformat },
		}

		local prettierrc = path .. ".prettierrc"
		conform.formatters.prettier = {
			prepend_args = { "--tab-width", "2", "--trailing-comma", "es5" },
		}

		vim.keymap.set({ "n", "v" }, "<leader>fmt", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or visual selection" })
	end,
}
