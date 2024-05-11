require("lazy").setup({
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		name = "rose-pine",
		config = function()
			require("configs.colors")
		end,
	},

	{ "neovim/nvim-lspconfig" },

	{ "williamboman/mason.nvim" },

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		branch = string.find(vim.loop.os_uname().sysname, "Windows") and "windows" or "main",
		config = function()
			require("fzf-lua").setup({ "telescope" })
			vim.keymap.set("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", { desc = "fuzzy find files" })
			vim.keymap.set("n", "<leader>fg", "<cmd>lua require('fzf-lua').git_files()<CR>", { desc = "fuzzy find git files" })
			vim.keymap.set("n", "<leader>fw", "<cmd>lua require('fzf-lua').live_grep_glob()<CR>", { desc = "fuzzy find grep" })
			vim.keymap.set("v", "<leader>fw", "<cmd>lua require('fzf-lua').grep_visual()<CR>", { desc = "fuzzy find grep visual selection" })
			vim.keymap.set("n", "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<CR>", { desc = "fuzzy find buffers" })
			vim.keymap.set("n", "<leader>fd", "<cmd>lua require('fzf-lua').lsp_declarations()<CR>", { desc = "fuzzy find declarations" })
			vim.keymap.set("n", "<leader>fr", "<cmd>lua require('fzf-lua').lsp_references()<CR>", { desc = "fuzzy find references" })
		end,
	},

	{ "mbbill/undotree" },

	{ "tpope/vim-fugitive" },

	{
		"numToStr/Comment.nvim",
		lazy = false,
	},

	{ "nvim-treesitter/nvim-treesitter" },

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
			vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
			vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

			vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
			vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
			vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
			vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
		end,
	},

	{ "nvim-treesitter/playground" },

	{ "williamboman/nvim-lsp-installer" },

	{ "williamboman/mason.nvim" },

	{ "williamboman/mason-lspconfig.nvim" },

	{ "neovim/nvim-lspconfig" },

	{
		"chrisgrieser/nvim-scissors",
		dependencies = "nvim-telescope/telescope.nvim",
		opts = {
			snippetDir = vim.fn.stdpath("config") .. "/snippets",
		},
	},

	{ "hrsh7th/nvim-cmp" },

	{ "hrsh7th/cmp-nvim-lsp" },

	{ "saadparwaiz1/cmp_luasnip" },

	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("configs.luasnip")
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{ "f-person/git-blame.nvim" },

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{ "stevearc/conform.nvim" },

	{ "mfussenegger/nvim-lint" },

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},

	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },

	{
		"stevearc/oil.nvim",
		config = function()
			require("configs.oil")
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"tris203/hawtkeys.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},

	{
		"andymass/vim-matchup",
		init = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},

	{ "nvim-tree/nvim-web-devicons" },

	{
		"lervag/vimtex",
		lazy = false,
	},

	{
		"ellisonleao/glow.nvim",
		config = function()
			require("glow").setup({
				style = "dark",
				width = 120,
			})
		end,
		cmd = "Glow",
	},

	{ "sindrets/diffview.nvim" },

	{
		"danymat/neogen",
		config = true,
		version = "*",
		init = function()
			require("neogen").setup({
				enabled = true,
				snippet_engine = "luasnip",
				languages = {
					lua = {
						template = {
							annotation_convention = "emmylua",
						},
					},
				},
			})

			local opts = { noremap = true, silent = true }
			vim.api.nvim_set_keymap("n", "<leader>af", ":lua require('neogen').generate({ type = 'function' })<CR>", opts)
			vim.api.nvim_set_keymap("n", "<leader>ac", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
			vim.api.nvim_set_keymap("n", "<leader>at", ":lua require('neogen').generate({ type = 'type' })<CR>", opts)
		end,
	},
})

