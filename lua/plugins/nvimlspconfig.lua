return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		"saghen/blink.cmp",
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"onsails/lspkind.nvim",
	},
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
					javascript = { suggest = { completeFunctionCalls = true } },
				},
			},
			lua_ls = {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
						diagnostics = { globals = { "vim" }, disable = { "missing-fields" } },
						workspace = { library = { vim.env.VIMRUNTIME }, checkThirdParty = false },
						telemetry = { enable = false },
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
					"Makefile",
					"meson.build",
					"build.ninja",
					".git",
				},
				capabilities = { offsetEncoding = { "utf-16" } },
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--header-insertion=iwyu",
					"--completion-style=detailed",
					"--function-arg-placeholders",
					"--fallback-style=llvm",
				},
				init_options = { usePlaceholders = true, completeUnimported = true, clangdFileStatus = true },
			},
			vimls = {},
			perlnavigator = {},
			rust_analyzer = {
				filetypes = { "rs" },
				on_attach = function(_, bufnr)
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end,
				settings = {
					["rust-analyzer"] = {
						imports = { granularity = { group = "module" }, prefix = "self" },
						cargo = { allFeatures = true, buildScripts = { enable = true } },
						checkOnSave = { command = "clippy" },
						procMacro = { enable = true },
					},
				},
			},
			yamlls = {
				before_init = function(_, new_config)
					local status, schemastore = pcall(require, "schemastore")
					if status then
						new_config.settings.yaml.schemas = vim.tbl_deep_extend(
							"force",
							new_config.settings.yaml.schemas or {},
							schemastore.yaml.schemas()
						)
					end
				end,
				settings = {
					redhat = { telemetry = { enabled = false } },
					yaml = {
						keyOrdering = false,
						format = { enable = true },
						validate = true,
						schemaStore = { enable = false, url = "" },
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
						python = { interpreterPath = "python" },
						ansible = { path = "ansible" },
						executionEnvironment = { enabled = false },
						validation = { enabled = true, lint = { enabled = true, path = "ansible-lint" } },
					},
				},
			},
			ruby_lsp = {},
			terraformls = {},
			groovyls = { filetypes = { "groovy", "jenkinsfile" } },
			-- cfn_lsp = {
			-- 	cmd = {
			-- 		"node",
			-- 		vim.fn.expand("$HOME") .. "/workspace/cloudformation-languageserver/out/server.js",
			-- 		"--stdio",
			-- 	},
			-- 	filetypes = { "template.yaml", "template.json", "serverless.yml", ".cfnlintrc" },
			-- 	settings = { cloudformation = {} },
			-- },
			zls = {},
			awk_ls = {},
			dockerls = {
				filetypes = { "Dockerfile", "dockerfile" },
				cmd = { "docker-language-server", "start", "--stdio" },
			},
			bashls = {
				cmd = { "bash-language-server", "start" },
				filetypes = { "sh", "zsh", "bash", "zshrc" },
				init_options = {
					bashls = {
						bashIde = { shellDialect = "bash" },
						shellcheckArguments = "-s bash -sol=zsh",
					},
				},
			},
		},
	},
	config = function(_, opts)
		-- 1. Initialize Mason package tools cleanly
		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"hadolint", -- Added here to permanently squash the ENOENT error
				"awk-language-server",
				"terraform-ls",
				"tflint",
				"html",
				"vtsls",
				"bash-language-server",
				"vimls",
				"lua-language-server",
				"pyright",
				"eslint",
				"ansible-language-server",
				"ansible-lint",
				"yamlls",
				"hclfmt",
				-- "cfn-lint",
				"groovy-language-server",
				"docker-language-server",
				"zls",
			},
		})
		require("mason-lspconfig").setup()

		local lspconfig = require("lspconfig")

		-- 2. Construct global fallback capabilities with Line Folding support
		local base_capabilities = vim.lsp.protocol.make_client_capabilities()
		base_capabilities.textDocument = base_capabilities.textDocument or {}
		base_capabilities.textDocument.foldingRange = {
			dynamicRegistration = true,
			lineFoldingOnly = true,
		}

		-- 3. Loop dynamically through your entire server config list with validation guards
		for server_name, server_config in pairs(opts.servers or {}) do
			-- Strip away invalid wildcard fields and ensure lspconfig knows the server engine
			if server_name ~= "*" and lspconfig[server_name] and type(lspconfig[server_name].setup) == "function" then
				local dynamic_capabilities =
					vim.tbl_deep_extend("force", {}, base_capabilities, server_config.capabilities or {})

				server_config.capabilities = require("blink.cmp").get_lsp_capabilities(dynamic_capabilities)

				-- Fire up the specific language server safely with its full settings block
				lspconfig[server_name].setup(server_config)
			elseif server_name ~= "*" then
				-- Notify only on unknown engine names, skip wildcards silently
				vim.notify(
					"lspconfig: Unrecognized server configuration target '" .. server_name .. "' skipped.",
					vim.log.levels.WARN
				)
			end
		end

		-- 4. Global LSP keybindings
		vim.keymap.set("n", "HH", vim.lsp.buf.hover, { desc = "LSP Hover Documentation" })
		vim.keymap.set("n", "RR", vim.lsp.buf.references, { desc = "LSP References" })
		vim.keymap.set("n", "DD", vim.lsp.buf.definition, { desc = "LSP Go to Definition" })
		vim.keymap.set("n", "CA", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
	end,
}
