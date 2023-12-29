local lsp = require("lsp-zero")

lsp.preset("recommended")

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-a>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
	["<Tab>"] = nil,
	["<S-Tab>"] = nil,
})

cmp.setup({
	snipet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mappings = cmp_mappings,
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
})

lsp.set_preferences({
	sign_icons = {},
})

local on_attach = function(client, bufnr)
	local function opts(_desc)
		return { buffer = bufnr, remap = false, desc = _desc }
	end

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts("Go to definition"))
	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts("Do code action"))
	vim.keymap.set("n", "<leader>rr", function()
		vim.lsp.buf.references()
	end, opts("Find references"))
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, opts("Rename symbol"))
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
end

local capabilities =
	require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "clangd", "lua_ls" },
	handlers = {
		lsp.default_setup,
		clangd = function()
			require("lspconfig").clangd.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--completion-style=bundled",
					"--cross-file-rename",
					"--header-insertion=iwyu",
				},
				init_options = {
					clangdFileStatus = true,
					usePlaceholders = true,
					completeUnimported = true,
					semanticHighlighting = true,
				},
			})
		end,
		lua_ls = function()
			require("lspconfig").lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemtry = { enable = false },
						diagnostics = { disable = { "undefined-global" } },
					},
				},
			})
		end,
	},
})

lsp.setup()

