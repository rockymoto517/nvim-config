local lsp = require("lsp-zero")

lsp.preset("recommended")

local cmp = require("cmp")
local cmp_action = lsp.cmp_action()
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-j>"] = cmp_action.select_prev_or_fallback(),
	["<C-n>"] = cmp_action.tab_complete(),
	["<C-a>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
	["<Tab>"] = nil,
	["<S-Tab>"] = nil,
})

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp_mappings,
	sources = {
		{ name = "path" },
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
		metals = function()
			require("lspconfig").metals.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end,
	},
})

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local function opts(desc)
			return { buffer = ev.buf, desc = desc }
		end
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover"))
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts("Signature help"))
		vim.keymap.set(
			"n",
			"<space>wa",
			vim.lsp.buf.add_workspace_folder,
			opts("Add workspace folder")
		)
		vim.keymap.set(
			"n",
			"<space>wr",
			vim.lsp.buf.remove_workspace_folder,
			opts("Remove workspace folder")
		)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts("Inspect workspace folders"))
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts("Go to type definition"))
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts("Rename symbol"))
		vim.keymap.set(
			{ "n", "v" },
			"<space>ca",
			vim.lsp.buf.code_action,
			opts("Do vim code action")
		)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Get references"))
	end,
})

lsp.setup()

