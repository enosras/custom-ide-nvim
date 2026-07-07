return {
	"stevearc/aerial.nvim",
	opts = {
		backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
		filetype_backends = {
			zsh = { "treesitter" },
			sh = { "treesitter" },
		},
		attach_mode = "window",
		-- Highlight the closest symbol if the cursor is not exactly on one.
		highlight_closest = true,

		-- Highlight the symbol in the source buffer when cursor is in the aerial win
		highlight_on_hover = false,
		icons = {},

		nerd_font = "auto",
		filter_kind = {
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
		on_attach = function(bufnr) end,

		-- Options for opening aerial in a floating win
		float = {
			-- Controls border appearance. Passed to nvim_open_win
			border = "rounded",

			-- Determines location of floating window
			--   cursor - Opens float on top of the cursor
			--   editor - Opens float centered in the editor
			--   win    - Opens float centered in the window
			relative = "cursor",

			-- These control the height of the floating window.
			-- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
			-- min_height and max_height can be a list of mixed types.
			-- min_height = {8, 0.1} means "the greater of 8 rows or 10% of total"
			max_height = 0.9,
			height = nil,
			min_height = { 8, 0.1 },

			override = function(conf, source_winid)
				-- This is the config that will be passed to nvim_open_win.
				-- Change values here to customize the layout
				return conf
			end,
		},
	},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
		"ibhagwan/fzf-lua",
	},
	keys = {
		{
			"<leader>LL",
			function()
				-- Calls the picker function directly from the repo
				require("aerial").fzf_lua_picker({
					-- Forward configuration profiles directly into fzf-lua layout engine
					winopts = {
						height = 0.60,
						width = 0.80,
						preview = {
							vertical = "down:50%", -- Preview panel layout placement
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
