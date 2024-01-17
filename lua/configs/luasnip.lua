local ls = require("luasnip")
local types = require("luasnip.util.types")
ls.setup({
	enable_autosnippets = true,
	update_events = { "TextChanged", "TextChangedI" },
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "●", "Blue" } },
			},
		},
		[types.insertNode] = {
			active = {
				virt_text = { { "●", "Orange" } },
			},
		},
	},
})

require("luasnip.loaders.from_vscode").load({
	paths = { "./snippets" },
})

vim.keymap.set("i", "<C-k>", function()
	ls.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-j>", function()
	ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-h>", function()
	ls.jump(-1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-e>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })

