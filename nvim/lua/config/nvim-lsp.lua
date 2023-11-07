return {
	setup = function()
		local lspconfig = require("lspconfig")
		local util = require("lspconfig.util")

		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		local on_attach = function(client, bufnr)
			if client.supports_method("documentSymbolProvider") then
				require("nvim-navic").attach(client, bufnr)
			end
		end

		vim.diagnostic.config({
			virtual_text = false,
		})
		vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

		lspconfig.tsserver.setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}
		lspconfig.cssls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}
		lspconfig.jsonls.setup {
			on_attach = on_attach,
			settings = {
				json = {
					schemas = {
						{
							description = "Renovate",
							fileMatch = { "renovate.json" },
							url = "https://docs.renovatebot.com/renovate-schema.json"
						},
						{
							description = "JSON schema for NPM package.json files",
							fileMatch = { "package.json" },
							url = "https://json.schemastore.org/package.json"
						},
						{
							description = "TypeScript compiler configuration file",
							fileMatch = { "tsconfig.json", "tsconfig.*.json" },
							url = "https://json.schemastore.org/tsconfig"
						},
						{
							description = "Lerna config",
							fileMatch = { "lerna.json" },
							url = "https://json.schemastore.org/lerna"
						},
						{
							description = "Babel configuration",
							fileMatch = { ".babelrc.json", ".babelrc", "babel.config.json" },
							url = "https://json.schemastore.org/lerna"
						},
						{
							description = "ESLint config",
							fileMatch = { ".eslintrc.json", ".eslintrc" },
							url = "https://json.schemastore.org/eslintrc"
						},
						{
							description = "Prettier config",
							fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
							url = "https://json.schemastore.org/prettierrc"
						},
						{
							description = "Vercel Now config",
							fileMatch = { "now.json" },
							url = "https://json.schemastore.org/now"
						},
					},
				},
			},
			capabilities = capabilities,
		}
		lspconfig.gopls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "go", "gomod", "gowork", "gotmpl", "gohtml" }, -- maybe add `gohtml` to nvim repo?
			settings = {
				gopls = {
					templateExtensions = { "gohtml" },
				}
			},
		}
		lspconfig.yamlls.setup {
			on_attach = on_attach,
			settings = {
				yaml = {
					schemas = {
						["https://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
						["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.yml",
						["https://raw.githubusercontent.com/lalcebo/json-schema/master/serverless/reference.json"] = "serverless.yml",
						["https://raw.githubusercontent.com/buildkite/pipeline-schema/main/schema.json"] = ".buildkite/pipeline.yml",
					}
				}
			},
			capabilities = capabilities,
		}
		lspconfig.dockerls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}
		lspconfig.html.setup {
			on_attach = on_attach,
			filetypes = { "html", "gohtml" }, -- add to nvim repo?
			capabilities = capabilities,
		}
		lspconfig.terraformls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}
		lspconfig.marksman.setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}
		lspconfig.grammarly.setup {
			on_attach = on_attach,
			cmd = { "asdf", "direnv", "shell", "nodejs", "16.14.0", "--", "grammarly-languageserver", "--stdio" },
			filetypes = { "markdown", "gitcommit" },
			capabilities = capabilities,
			init_options = { clientId = vim.env.GRAMMARLY_CLIENT_ID },
			root_dir = function(fname)
				local root_files = { '.marksman.toml' }
				return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
			end,
		}
		lspconfig.ruby_ls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}
		lspconfig.lua_ls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = 'LuaJIT',
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { 'vim' },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = {
							vim.api.nvim_get_runtime_file("", true),
							"~/.hammerspoon/Spoons/EmmyLua.spoon/annotations",
						},
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		}
	end,
}
