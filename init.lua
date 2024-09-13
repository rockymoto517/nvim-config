-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.cindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

-- So it's different on my linux and windows setups
vim.opt.undodir = require("undodir")
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

-- Disable netrw in favor of oil
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- Set python venv
vim.g.python3_host_prog = require("python3_path")

-- self explanatory
vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Open file at the last position it was edited earlier",
	group = misc_augroup,
	pattern = "*",
	command = 'silent! normal! g`"zv',
})

-- Load native rebinds and plugins
require("keys")
require("plugins")

-- Load plugin configurations
require("configs.colors")
require("configs.lspconfig")
require("configs.treesitter")
require("configs.trouble")
require("configs.harpoon")
require("configs.conform")
require("configs.linting")
require("configs.whichkey")
require("configs.masoninstaller")
require("configs.textobjects")
require("configs.hawtkeys")
require("configs.snips")
require("configs.vimtex")

-- Plugin setups
require("Comment").setup()
require("mason").setup()
require("ibl").setup()
require("lualine").setup()
require("gitblame").setup()
require("mini.pairs").setup()

if vim.g.neovide then
	require("neovide")
end
