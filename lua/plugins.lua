return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

    use "neovim/nvim-lspconfig"

    use "williamboman/mason.nvim"

    use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } }

    use "mbbill/undotree"

    use "tpope/vim-fugitive"

    use {
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end
	}

    use { "smoka7/multicursors.nvim", requires = { "smoka7/hydra.nvim" } }

    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    }

    use {
        "nvim-treesitter/nvim-treesitter",
		{ run = ":TSUpdate" },
	}

	use "nvim-treesitter/playground"

	use {
	    'VonHeikemen/lsp-zero.nvim',
	    branch = 'v3.x',
	    requires = {
			{ "williamboman/nvim-lsp-installer" },
		    { 'williamboman/mason.nvim' },
		    { 'williamboman/mason-lspconfig.nvim' },

			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'L3MON4D3/LuaSnip' },
		}
	}

	use "lukas-reineke/indent-blankline.nvim"

	use "norcalli/nvim-colorizer.lua"

	use {
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	}

	use({
		"kylechui/nvim-surround",
		tag = "*",
		config = function()
			require("nvim-surround").setup()
		end,
	})
end)
