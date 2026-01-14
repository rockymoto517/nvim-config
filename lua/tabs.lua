local double_tab = {
	["javascript"] = true,
	["javascriptreact"] = true,
	["typescript"] = true,
	["typescriptreact"] = true,
	["yaml"] = true,
	["css"] = true,
}

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("settabstop", { clear = true }),
	callback = function()
		if double_tab[vim.o.filetype] then
			vim.o.shiftwidth = 2
			vim.o.tabstop = 2
			vim.o.softtabstop = 2
		else
			vim.o.shiftwidth = 4
			vim.o.tabstop = 4
			vim.o.softtabstop = 4
		end
	end,
})
