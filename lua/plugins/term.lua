return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {},
	init = function()
		local powershell_options = {
			shell = "powershell",
			shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
			shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
			shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
			shellquote = "",
			shellxquote = "",
		}

		for option, value in pairs(powershell_options) do
			vim.opt[option] = value
		end
		vim.keymap.set("", [[<C-\>]], "<CMD>1ToggleTerm size=40 dir=" .. vim.fn.getcwd() .. " direction=float<CR>", { desc = "Toggle floating terminal" })
	end,
}
