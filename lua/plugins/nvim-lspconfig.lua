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
		servers = {
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
			html = {},
			ruby_lsp = {},
		},
	},
	-- config = function(_, opts)
	-- 	local lspconfig = require("lspconfig")
	-- 	for server, config in pairs(opts.servers) do
	-- 		-- passing config.capabilities to blink.cmp merges with the capabilities in your
	-- 		-- `opts[server].capabilities, if you've defined it
	-- 		config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
	-- 		lspconfig[server].setup(config)
	-- 	end
	-- end
	config = function()
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
				"vimls",
				"lua-language-server",
				"pyright",
				"eslint",
				{ "prettier", version = "3.0.0" },
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
		-- maybe delete if it fails --
		vim.keymap.set("n", "HH", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "RR", vim.lsp.buf.references, {})
		vim.keymap.set("n", "DD", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "CA", vim.lsp.buf.code_action, {})
	end,
}
