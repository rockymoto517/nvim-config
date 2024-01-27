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

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			"williamboman/nvim-lsp-installer",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- LSP Support
			"neovim/nvim-lspconfig",
		},
	},

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

	{ "norcalli/nvim-colorizer.lua" },

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

	{ "nvim-lua/plenary.nvim" },

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
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
})

