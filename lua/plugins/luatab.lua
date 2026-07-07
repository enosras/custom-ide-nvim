return {
	{
		"ergodice/statuscol-oil.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"stevearc/oil.nvim",
			-- "luukvbaal/statuscol.nvim",
		},
		opts = {},
		config = function()
			require("statuscol-oil").setup()
		end,
	},

	{
		"suketa/nvim-dap-ruby",
		config = function()
			require("dap-ruby").setup()
		end,
	},

	-- I use this for a couple of diplay features
	-- here is more
	-- -----------
	{
		"stevearc/oil.nvim",
		opts = {},
		config = function()
			require("oil").setup({
				-- Force oil to render its metadata column layout out of the text buffer
				columns = { "icon", "permissions", "size", "mtime" },
				vim.keymap.set("n", "-", require("oil").open, { desc = "Open Parent Directory" }),
			})

			-- Safely inject statuscol-oil only inside Oil buffers without breaking LazyVim
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "oil",
				callback = function(args)
					vim.wo.statuscolumn = "%!v:lua.require('statuscol-oil').get_meta({ buf = " .. args.buf .. " })"
				end,
			})
		end,
	},
	-- ---- -----
	{ "sindrets/diffview.nvim" },
	{
		"mvllow/modes.nvim",
		tag = "v0.2.1",
		-- config = function()
		-- 	require("modes").setup()
		-- end,
		config = function()
			require("modes").setup({
				-- colors = {
				-- 	-- Catppuccin Mocha hex color choices
				-- 	insert = "#99b79a", -- Blue
				-- 	visual = "#651fff", -- VIOLET
				-- 	delete = "#f38ba8", -- Red
				-- 	copy = "#f9e2af", -- Yellow
				-- },
				line_opacity = 0.15, -- Slight color glow on the current line background
				set_cursor = true, -- Changes cursor color to match the mode
				set_cursorline = true, -- Colors the line background
				set_number = true, -- Colors the line numbers
				set_signcolumn = true, -- Colors the left sidebar column gutter
			})
			vim.o.cmdheight = 0
		end,
	},
	{
		"mcauley-penney/visual-whitespace.nvim",
		event = "ModeChanged *:[vV\22]", -- optionally, lazy load on entering visual mode
		opts = {
			-- your opts here ...
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		sections = {
			lualine_x = { "aerial" },

			-- Or you can customize it
			lualine_y = {
				{
					"aerial",
					-- The separator to be used to separate symbols in status line.
					sep = " ) ",

					-- The number of symbols to render top-down. In order to render only 'N' last
					-- symbols, negative numbers may be supplied. For instance, 'depth = -1' can
					-- be used in order to render only current symbol.
					depth = nil,

					-- When 'dense' mode is on, icons are not rendered near their symbols. Only
					-- a single icon that represents the kind of current symbol is rendered at
					-- the beginning of status line.
					dense = false,

					-- The separator to be used to separate symbols in dense mode.
					dense_sep = ".",

					-- Color the symbol icons.
					colored = true,
				},
			},
		},
		opts = function(_, opts)
			-- Extract the Catppuccin palette dynamically
			local colors = require("catppuccin.palettes").get_palette()

			-- Force the default theme components to use purple/mauve accents
			-- opts.options.theme = "catppuccin"

			-- Custom section theme overrides
			opts.options.component_separators = { left = "│", right = "│" }
			opts.options.section_separators = { left = "", right = "" }

			-- Redefine section colors to match your purple aesthetic
			opts.sections.lualine_a = { { "mode", color = { bg = colors.mauve, fg = colors.crust, gui = "bold" } } }
			opts.sections.lualine_b = { { "branch", color = { fg = colors.mauve } } }
		end,
	},
}

-- { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
-- {
-- 	"alvarosevilla95/luatab.nvim",
-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
-- },
-- { "danilamihailov/beacon.nvim" },
-- { "adelarsq/neoline.vim" },
-- ------ ------------- ---
-- these plugins are not related --
-- ----------
-- {
-- 	"nvim-lualine/lualine.nvim",
-- 	-- lazy = "false",
-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
-- 	-- require("lualine").setup({
-- 	opts = {
-- 		options = {
-- 			icons_enabled = true,
-- 			theme = "auto",
-- 			component_separators = { left = "", right = "" },
-- 			section_separators = { left = "", right = "" },
-- 			disabled_filetypes = {
-- 				statusline = {},
-- 				winbar = {},
-- 			},
-- 			ignore_focus = {},
-- 			always_divide_middle = true,
-- 			always_show_tabline = true,
-- 			globalstatus = false,
-- 			refresh = {
-- 				statusline = 1000,
-- 				tabline = 1000,
-- 				winbar = 1000,
-- 				refresh_time = 16, -- ~60fps
-- 				events = {
-- 					"WinEnter",
-- 					"BufEnter",
-- 					"BufWritePost",
-- 					"SessionLoadPost",
-- 					"FileChangedShellPost",
-- 					"VimResized",
-- 					"Filetype",
-- 					"CursorMoved",
-- 					"CursorMovedI",
-- 					"ModeChanged",
-- 				},
-- 			},
-- 		},
-- 		sections = {
-- 			lualine_a = { "mode" },
-- 			lualine_b = { "branch", "diff", "diagnostics" },
-- 			lualine_c = { "filename" },
-- 			lualine_x = { "encoding", "fileformat", "filetype" },
-- 			lualine_y = { "progress" },
-- 			lualine_z = { "location" },
-- 		},
-- 		inactive_sections = {
-- 			lualine_a = {},
-- 			lualine_b = {},
-- 			lualine_c = { "filename" },
-- 			lualine_x = { "location" },
-- 			lualine_y = {},
-- 			lualine_z = {},
-- 		},
-- 		tabline = {},
-- 		winbar = {},
-- 		inactive_winbar = {},
-- 		extensions = {},
-- 	},
-- },
