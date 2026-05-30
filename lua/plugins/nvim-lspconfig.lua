return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"onsails/lspkind.nvim",
	},
	lazy = false,
	-- in case you want something to delete later ---
	opts = {
		format_notify = true,
		inlay_hints = { enabled = false },
		servers = {
			vtsls = {
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
				},
				settings = {
					javascript = {
						suggest = { completeFunctionCalls = true },
					},
				},
			},
			lua_ls = {
				-- on_attach = on_attach,
				settings = {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
							path = vim.split(package.path, ";"),
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim" },
							-- Diabling missing fields error
							disable = { "missing-fields" },
						},
						workspace = {
							-- Make the server aware of Neovim runtime files and plugins
							library = { vim.env.VIMRUNTIME },
							checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			},
			gopls = {
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				staticcheck = true,
				gofumpt = true,
			},
			kotlin_language_server = {},
			pyright = {},
			clangd = {
				root_markers = {
					"compile_commands.json",
					"compile_flags.txt",
					"configure.ac", -- AutoTools
					"Makefile",
					"configure.ac",
					"configure.in",
					"config.h.in",
					"meson.build",
					"meson_options.txt",
					"build.ninja",
					".git",
				},
				capabilities = {
					offsetEncoding = { "utf-16" },
				},
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--header-insertion=iwyu",
					"--completion-style=detailed",
					"--function-arg-placeholders",
					"--fallback-style=llvm",
				},
				init_options = {
					usePlaceholders = true,
					completeUnimported = true,
					clangdFileStatus = true,
				},
			},
			vimls = {},
			perlnavigator = {},
			rust_analyzer = {
				filetypes = { "rs" },
				on_attach = function(client, bufnr)
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end,
				settings = {
					["rust-analyzer"] = {
						imports = {
							granularity = {
								group = "module",
							},
							prefix = "self",
						},
						cargo = {
							allFeatures = true,
							buildScripts = {
								enable = true,
							},
						},
						checkOnSave = { command = "clippy" },
						procMacro = {
							enable = true,
						},
					},
				},
			},
			yamlls = {

				-- Have to add this for yamlls to understand that we support line folding
				capabilities = {
					textDocument = {
						foldingRange = {
							dynamicRegistration = false,
							lineFoldingOnly = true,
						},
					},
				},
				-- lazy-load schemastore when needed
				before_init = function(_, new_config)
					new_config.settings.yaml.schemas = vim.tbl_deep_extend(
						"force",
						new_config.settings.yaml.schemas or {},
						require("schemastore").yaml.schemas()
					)
				end,
				settings = {
					redhat = { telemetry = { enabled = false } },
					yaml = {
						keyOrdering = false,
						format = {
							enable = true,
						},
						validate = true,
						schemaStore = {
							-- Must disable built-in schemaStore support to use
							-- schemas from SchemaStore.nvim plugin
							enable = false,
							-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
							url = "",
						},
					},
				},
			},
			html = {},
			ansiblels = {
				cmd = { "ansible-language-server", "--stdio" },
				filetypes = { "yaml.ansible" },
				root_markers = { "ansible.cfg", ".ansible-lint", ".git", "playbook.yml" },
				settings = {
					ansible = {
						python = {
							interpreterPath = "python",
						},
						ansible = {
							path = "ansible",
						},
						executionEnvironment = {
							enabled = false,
						},
						validation = {
							enabled = true,
							lint = {
								enabled = true,
								path = "ansible-lint",
							},
						},
					},
				},
			},
			ruby_lsp = {},
			terraformls = {},
			groovyls = { filetypes = "groovy" },
			cfn_lsp = {
				cmd = {
					"node",
					vim.fn.expand("$HOME") .. "/workspace/cloudformation-languageserver/out/server.js",
					"--stdio",
				},
				filetypes = { "template.yaml", "template.json", "serverless.yml", ".cfnlintrc" },
				settings = { cloudformation = {} },
			},

			-- hclls = {},
			promql_langserver = {
				cmd = { "promql-langserver", "--stdio" },
				filetypes = { "promql" },
				-- Adjust root directory detection based on your repo structure
				-- root_dir = lspconfig.util.root_pattern(".git", "prometheus.yml"),
			},
			bashls = {
				cmd = { "bash-language-server", "start" },
				filetypes = { "sh", "zsh", "bash" },
			},
		},
	},
	--vim.o.shell = "/bin/zsh"  -- Or "/bin/bash" or whichever path your shell is located

	-- config = function(_, opts)
	-- 	local lspconfig = require("lspconfig")
	-- 	for server, config in pairs(opts.servers) do
	-- 		-- passing config.capabilities to blink.cmp merges with the capabilities in your
	-- 		-- `opts[server].capabilities, if you've defined it
	-- 		config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
	-- 		lspconfig[server].setup(config)
	-- 	end
	-- end
	config = function(_, opts)
		-- local original_capabilities = {
		-- 	textDocument = {
		-- 		foldingRange = {
		-- 			dynamicRegistration = true, --false
		-- 			lineFoldingOnly = true, --true
		-- 		},
		-- 		-- might delete later
		-- 		-- {
		-- 		-- 	require("blink.cmp").get_lsp_capabilities(capabilities),
		-- 		-- },
		-- 	},
		-- },
		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"terraform-ls",
				"tflint",
				"html",
				"vtsls",
				"bash-language-server",
				"vimls",
				"lua-language-server",
				"pyright",
				"eslint",
				{ "prettier", version = "3.0.0" },
				"ansible-language-server",
				"ansible-lint",
				"yamlls",
				"hclfmt",
				"cfn-lint",
				"groovy-language-server",
				-- "promql_langserver",
			},
		})
		local lspconfig = require("lspconfig")

		local original_capabilities = vim.lsp.protocol.make_client_capabilities()
		original_capabilities.textDocument = original_capabilities.textDocument or {}
		original_capabilities.textDocument.foldingRange = {
			dynamicRegistration = true,
			lineFoldingOnly = true,
		}
		local capabilities = require("blink.cmp").get_lsp_capabilities(original_capabilities)
		lspconfig["lua_ls"].setup({ capabilities = capabilities })
		lspconfig["clangd"].setup({ capabilities = capabilities })
		lspconfig["pyright"].setup({ capabilities = capabilities })
		lspconfig["gopls"].setup({ capabilities = capabilities })
		lspconfig["vimls"].setup({ capabilities = capabilities })
		lspconfig["perlnavigator"].setup({ capabilities = capabilities })
		lspconfig["rust_analyzer"].setup({ capabilities = capabilities })
		lspconfig["html"].setup({ capabilities = capabilities })
		lspconfig["ruby_lsp"].setup({ capabilities = capabilities })
		lspconfig["bashls"].setup({ capabilities = capabilities })
		lspconfig["ansiblels"].setup({ capabilities = capabilities })
		lspconfig["yamlls"].setup({ capabilities = capabilities })
		lspconfig["kotlin_language_server"].setup({ capabilities = capabilities })
		lspconfig["vtsls"].setup({ capabilities = capabilities })
		lspconfig["html"].setup({ capabilities = capabilities })
		lspconfig["terraformls"].setup({ capabilities = capabilities })
		-- lspconfig["hclls"].setup({ capabilities = capabilities })

		lspconfig["groovyls"].setup({ capabilities = capabilities })

		-- lspconfig["promql-langserver"].setup({ capabilities = capabilities })
		-- lspconfig["cfn-lint"].setup({ capabilities = capabilities })

		-- some additions if the lsp seem to be failing

		--       for server_name, server_config in pairs(opts.servers or {}) do
		-- 	server_config = vim.tbl_deep_extend("force", {}, server_config, {
		-- 		capabilities = require("blink.cmp").get_lsp_capabilities(server_config.capabilities or capabilities),
		-- 	})
		-- 	lspconfig[server_name].setup(server_config)
		-- end
		-- maybe delete if it fails --
		vim.keymap.set("n", "HH", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "RR", vim.lsp.buf.references, {})
		vim.keymap.set("n", "DD", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "CA", vim.lsp.buf.code_action, {})
	end,
}
