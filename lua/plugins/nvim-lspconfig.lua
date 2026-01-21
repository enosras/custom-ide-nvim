return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	lazy = false,
	-- in case you want something to delete later ---
	opts = {
		servers = {
			lua_ls = {},
			gopls = {},
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
			rust_analyzer = {},
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
				"lua-language-server",
				"pyright",
				"eslint",
				{ "prettier", version = "3.0.0" },
			},
		})
		local lspconfig = require("lspconfig")
		local original_capabilities = vim.lsp.protocol.make_client_capabilities()
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
	end,
}
-- old nvim-cmp options
--   config = function()
-- 		vim.lsp.enable("jsonls")
-- 		vim.lsp.enable("perlnavigator")
-- 		vim.lsp.enable("yamlls")
-- 		vim.lsp.enable("zls")
-- 		vim.lsp.enable("ruby_lsp")
-- 		vim.lsp.enable("pyright")
-- 		vim.lsp.enable("lua_ls")
-- 		vim.lsp.enable("clangd")
-- 		vim.lsp.enable("gopls")
-- 		vim.lsp.enable("html")
-- 		vim.lsp.enable("vimls")
-- 		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
-- 		vim.keymap.set("n", "L", vim.lsp.buf.references, {})
-- 		vim.keymap.set("n", "D", vim.lsp.buf.definition, {})
-- 		vim.keymap.set("n", "P", vim.lsp.buf.code_action, {})
-- 	end,
--}
