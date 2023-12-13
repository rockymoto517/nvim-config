vim.g.mapleader = " "

vim.keymap.set('n', "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', "Q", "<nop>")
vim.keymap.set('n', "J", "mzJ`z")
vim.keymap.set('n', "<C-d>", "<C-d>zz")
vim.keymap.set('n', "<C-u>", "<C-u>zz")
vim.keymap.set('n', "n", "nzzzv")
vim.keymap.set('n', "N", "Nzzzv")
vim.keymap.set('n', "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set('n', "<leader>gs", vim.cmd.Git)
vim.keymap.set('n', "<leader>rp", ":term python %<CR>")
vim.keymap.set('n', "<leader>M", function()
	if require("multicursors.search").find_pattern(true) then
		require("multicursors.layers").normal_hydra:activate()
	end
end)
vim.keymap.set('n', "<leader>wt", function()
    local cursor = vim.fn.getpos('.')
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos('.', cursor)
end)

vim.keymap.set('v', "J", ":m '>+1<CR>gv=gv")
vim.keymap.set('v', "K", ":m '<-2<CR>gv=gv")
vim.keymap.set({ 'v', 'n' }, "<leader> m", "MCstart")

vim.keymap.set('x', "<leader>p", "\"_dP")
