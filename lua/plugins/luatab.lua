return {
	-- I use this for a couple of diplay features
	-- here is more
	-- -----------
	-- { "stevearc/oil.nvim" },
	-- ---- -----
	{
		"mvllow/modes.nvim",
		tag = "v0.2.1",
		config = function()
			require("modes").setup()
		end,
	},
	{
		"mcauley-penney/visual-whitespace.nvim",
		event = "ModeChanged *:[vV\22]", -- optionally, lazy load on entering visual mode
		opts = {
			-- your opts here ...
		},
	},
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{
		"alvarosevilla95/luatab.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- { "danilamihailov/beacon.nvim" },
	-- { "adelarsq/neoline.vim" },
	-- ------ ------------- ---
	-- these plugins are not related --
	-- ----------
	{
		"nvim-lualine/lualine.nvim",
		-- lazy = "false",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- require("lualine").setup({
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
					refresh_time = 16, -- ~60fps
					events = {
						"WinEnter",
						"BufEnter",
						"BufWritePost",
						"SessionLoadPost",
						"FileChangedShellPost",
						"VimResized",
						"Filetype",
						"CursorMoved",
						"CursorMovedI",
						"ModeChanged",
					},
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		},
	},
}
