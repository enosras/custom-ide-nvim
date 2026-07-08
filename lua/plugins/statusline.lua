return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "stevearc/aerial.nvim", "nvim-tree/nvim-web-devicons" }, -- Ensure aerial is loaded
	opts = function()
		-- Extract the Catppuccin palette
		local colors = require("catppuccin.palettes").get_palette()
		-- Define your base configuration structure
		return {
			options = {
				theme = "catppuccin", -- Fixed typo (was missing a 'p')
				component_separators = { left = "│", right = "│" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				-- Your custom purple aesthetic overrides
				lualine_a = {
					{ "mode", color = { bg = colors.mauve, fg = colors.crust, gui = "bold" } },
				},
				lualine_b = {
					{ "branch", color = { fg = colors.mauve, bg = colors.mantle } },
				},
				lualine_c = {
					-- the Language Icon (Python, Rust, etc.)
					{
						"filetype",
						icon_only = true, -- Hide the text name, keep only the icon
						-- colored = true, -- Keeps the icon's original language color (e.g., blue for Python)
						-- Or override it to mauve by uncommenting the line below:
						color = { fg = colors.mauve },
					},
					-- the Filename Text
					{
						"filename",
						file_status = true, -- Displays file status (readonly, modified)
						path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
						color = { fg = colors.mauve }, -- Force the text path to be mauve
					},
				},
				-- Aerial component placements
				-- lualine_x = { "aerial", color = { bg = colors.mauve } },
				lualine_x = {
					-- File formatting info e.g., 'unix', 'dos'
					{ "fileformat", color = { fg = colors.overlay1 } },
					-- File encoding (e.g., 'utf-8')
					{ "encoding", color = { fg = colors.overlay1 } },
					-- Aerial component
					-- { "aerial" },
				},

				lualine_y = {
					{
						"aerial",
						sep = " ) ",
						depth = nil,
						dense = false,
						dense_sep = ".",
						-- colored = true,
						color = { fg = colors.mauve, bg = colors.mantle },
					},
				},
			},
		}
	end,
}
