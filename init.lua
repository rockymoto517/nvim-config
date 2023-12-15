vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

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
vim.opt.clipboard:append { "unnamed", "unnamedplus" }

require("keys")
require("plugins")

require("configs.colors")
require("configs.lspconfig")
require("configs.telescope")
require("configs.treesitter")
require("configs.trouble")
require("configs.harpoon")

-- Plugin setups
require("mason").setup()
require("ibl").setup()
require("colorizer").setup({}, { names = false })
require("lualine").setup()
require("gitblame").setup()
