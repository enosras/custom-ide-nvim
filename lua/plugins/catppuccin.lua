return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,

		config = function()
			require("catppuccin").setup({
				-- auto_integrations = true,
				flavour = "mocha", -- latte, frappe, macchiato, mocha, default is auto
				background = { -- :h background
					--light = "mocha",
					dark = "mocha",
				},
				transparent_background = false, -- disables setting the background color.
				float = {
					transparent = false, -- enable transparent floating windows
					solid = false, -- use solid styling for floating windows, see |winborder|
				},
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "italic" },
					loops = {},
					functions = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
					-- miscs = {}, -- Uncomment to turn off hard-coded styles
				},
				lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
						ok = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
				color_overrides = {},
				custom_highlights = {},
				default_integrations = true,
				auto_integrations = false,
				integrations = {
					fzf = true,
					-- cmp = true,
					gitsigns = true,
					nvimtree = true,
					notify = false,
					blink_cmp = {
						enabled = true,
						style = "bordered",
					},
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
				custom_highlights = function(colors)
					return {
						BlinkCmpMenu = { bg = colors.base },
						BlinkCmpMenuBorder = { bg = colors.base, fg = colors.mauve },
						BlinkCmpDoc = { bg = colors.base },
						BlinkCmpDocBorder = { bg = colors.base, fg = colors.mauve },
						BlinkCmpSignatureHelp = { bg = colors.mantle },
						BlinkCmpSignatureHelpBorder = { fg = colors.base, bg = colors.mauve },
					}
				end,
			})
			-- setup must be called before loading
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
