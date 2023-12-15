local lint = require("lint")
lint.linters_by_ft = {
	cpp = { "clangtidy" },
	python = { "pylint" },
}

lint.linters.clangtidy.args = {
	args = {
		"--quiet",
		"--checks=llvm-*",
	},
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

vim.keymap.set("n", "<leader>lt", function()
	lint.try_lint()
end, { desc = "Lint file" })

