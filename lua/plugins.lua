return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("neovim/nvim-lspconfig")

	use("williamboman/mason.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	use("mbbill/undotree")

	use("tpope/vim-fugitive")

	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	})

	use({ "smoka7/multicursors.nvim", requires = { "smoka7/hydra.nvim" } })

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		{ run = ":TSUpdate" },
	})

	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
		config = function()
			local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
			vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
			vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

			vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
			vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
			vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
			vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
		end,
	})

	use("nvim-treesitter/playground")

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			{ "williamboman/nvim-lsp-installer" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- LSP Support
			{ "neovim/nvim-lspconfig" },
		},
	})

	use({
		"chrisgrieser/nvim-scissors",
		config = function()
			require("scissors").setup({})
		end,
	})

	use("hrsh7th/nvim-cmp")

	use("hrsh7th/cmp-nvim-lsp")

	use("saadparwaiz1/cmp_luasnip")

	use({
		"L3MON4D3/LuaSnip",
		after = "nvim-cmp",
		config = function()
			local types = require("luasnip.util.types")
			require("luasnip").setup({
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
		end,
	})

	use("lukas-reineke/indent-blankline.nvim")

	use("norcalli/nvim-colorizer.lua")

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	use({
		"kylechui/nvim-surround",
		tag = "*",
		config = function()
			require("nvim-surround").setup()
		end,
	})

	use({
		"folke/trouble.nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	use("f-person/git-blame.nvim")

	use("nvim-lua/plenary.nvim")

	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("stevearc/conform.nvim")

	use("mfussenegger/nvim-lint")

	use("folke/which-key.nvim")

	use("WhoIsSethDaniel/mason-tool-installer.nvim")

	use("christoomey/vim-tmux-navigator")

	use({
		"stevearc/oil.nvim",
		config = function()
			require("configs.oil")
		end,
	})

	use("tris203/hawtkeys.nvim")

	use("nvim-tree/nvim-web-devicons")
end)

