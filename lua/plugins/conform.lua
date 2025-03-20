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
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				else
					return { timeout_ms = 1000, lsp_format = "fallback" }
				end
			end,
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
				async = true,
				timeout_ms = 500,
			})
		end, { desc = "Format file or visual selection" })

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
		vim.keymap.set("n", "<leader>fmg", function()
			vim.g.disable_autoformat = not vim.g.disable_autoformat
		end, { desc = "Toggle autoformat on save" })
	end,
}
