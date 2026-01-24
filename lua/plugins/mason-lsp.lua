return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		automatic_installation = true,
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
		"saghen/blink.cmp",
	},

	config = function()
		local original_capabilities = vim.lsp.protocol.make_client_capabilities()
		--delete immediately
		local capabilities = require("blink.cmp").get_lsp_capabilities(original_capabilities)
		require("mason-lspconfig").setup({
			automatic_enable = true,
			-- { "lua_ls", "clangd", "vimls", "pyright" },
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"html",
				"yamlls",
				"zls",
				"vimls",
				"bashls",
				"pyright",
				"clangd",
				"gopls",
				"ruby_lsp",
				"jsonls",
				"perlnavigator",
			},
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					-- This handles overriding only values explicitly passed
					-- by the server configuration above. Useful when disabling
					-- certain features of an LSP (for example, turning off formatting for ts_ls)
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}

--#region Old config
-- return {
-- "mason-org/mason-lspconfig.nvim",
-- dependencies = {
--     { "mason-org/mason.nvim", opts = {} },
--     "neovim/nvim-lspconfig",
-- },
-- opts = {
--     automatic_enable = true,
--     ensure_installed = {
--         "lua_ls",
--         "html",
--         "yamlls",
--         "zls",
--         "vimls",
--         "bashls",
--         "pyright",
--         "clangd",
--         "gopls",
--         "ruby_lsp",
--         "jsonls",
--     },
-- },
-- config = function(_, opts)
--     require("mason-lspconfig").setup(opts)
-- end,
-- }
--#endregion
