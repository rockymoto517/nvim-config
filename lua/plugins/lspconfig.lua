return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")

		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = {
				["<C-a>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<Tab>"] = nil,
				["<S-Tab>"] = nil,
				["<C-n>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_next_item({ behavior = "insert" })
					else
						cmp.complete()
					end
				end),
				["<C-p>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_prev_item({ behavior = "insert" })
					else
						cmp.complete()
					end
				end),
				["<C-e>"] = cmp.mapping.abort(),
			},
			sources = {
				{ name = "path" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			},
		})

		local on_attach = function(client, bufnr)
			local function opts(_desc)
				return { buffer = bufnr, noremap = true, silent = true, desc = _desc }
			end

			vim.keymap.set("n", "<leader>gd", function()
				vim.lsp.buf.definition()
			end, opts("Go to definition"))
			vim.keymap.set("n", "<leader>gD", function()
				vim.lsp.buf.declaration()
			end, opts("Go to declaration"))
			vim.keymap.set("n", "<leader>gi", function()
				vim.lsp.buf.implementation()
			end, opts("Go to implementation"))
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

		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
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

		lspconfig.metals.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		require("mason").setup({})
		require("mason-lspconfig").setup({
			handlers = {
				function(name, opts)
					if type(name) ~= "string" then
						return false
					end

					if type(opts) ~= "table" then
						opts = {}
					end

					local lsp = require("lspconfig")[name]
					local ok = pcall(lsp.setup, opts)
					if not ok then
						local msg = "[lsp] Failed to setup %s.\n" .. "Configure this server using lspconfig to get the full error message."

						vim.notify(msg:format(name), vim.log.levels.WARN)
						return false
					end
					return true
				end,
				clangd = function()
					lspconfig.clangd.setup({
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
					lspconfig.lua_ls.setup({
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
				rust_analyzer = function()
					lspconfig.rust_analyzer.setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
				omnisharp = function()
					lspconfig.omnisharp.setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
				html = function()
					lspconfig.html.setup({
						on_attach = on_attach,
						capabilities = capabilities,
						settings = {
							filetypes = { "html", "templ" },
						},
					})
				end,
				ts_ls = function()
					lspconfig.ts_ls.setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
			},
		})

		-- Not dependent on Mason
		lspconfig.zls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
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
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover"))
				--[[ Disable these, they're used elsewhere
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts("Signature help"))
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts("Inspect workspace folders"))
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts("Go to type definition"))
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts("Rename symbol"))
				vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts("Do vim code action"))
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Get references")) ]]
			end,
		})
	end,
}
