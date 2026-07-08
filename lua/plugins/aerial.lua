return {
	"stevearc/aerial.nvim",
	opts = {
		backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
		filetype_backends = {
			zsh = { "treesitter" },
			sh = { "treesitter" },
		},
		attach_mode = "window",
		highlight_closest = true,
		highlight_on_hover = false,
		icons = {},
		nerd_font = true,
		filter_kind = {
			"Field",
			"Variable",
			"Constant",
			"Property",
			"Class",
			"Constructor",
			"Enum",
			"Function",
			"Interface",
			"Module",
			"Method",
			"Struct",
		},
		show_trailing_spaces = false,
		on_attach = function(bufnr)
			-- Jump backwards and forwards through symbols
			vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr, desc = "Previous Symbol" })
			vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr, desc = "Next Symbol" })
		end,

		float = {
			border = "rounded",
			relative = "cursor",
			max_height = 0.9,
			height = nil,
			min_height = { 8, 0.1 },
			override = function(conf, source_winid)
				return conf
			end,
		},
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
		"ibhagwan/fzf-lua",
	},
	keys = {
		{
			"<leader>LL",
			function()
				-- Fetch the plugin opts explicitly
				local opts = require("lazy.core.config").plugins["aerial.nvim"].opts or {}

				require("aerial").fzf_lua_picker({
					opts = opts,
					winopts = {
						height = 0.60,
						width = 0.80,
						preview = {
							vertical = "down:50%",
						},
					},
				})
			end,
			desc = "Find Code Symbols (Aerial + Fzf-Lua)",
		},
	},
	config = function(_, opts)
		require("aerial").setup(opts)
	end,
}
