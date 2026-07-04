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
				-- custom_highlights = {},
				default_integrations = true,
				auto_integrations = true, -- false
				integrations = {
					snacks = true,
					noice = true,
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
						indentscope_color = "mauve",
					},
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
				custom_highlights = function(colors)
					return {
						-- blink highlight groups
						BlinkCmpMenu = { bg = colors.base },
						BlinkCmpMenuBorder = { bg = colors.base, fg = colors.mauve },
						BlinkCmpDoc = { bg = colors.base },
						BlinkCmpDocBorder = { bg = colors.base, fg = colors.mauve },
						BlinkCmpSignatureHelp = { bg = colors.mantle },
						BlinkCmpSignatureHelpBorder = { fg = colors.base, bg = colors.mauve },
						-- ---------------------------------------------------
						-- float generic config for hi groups
						FloatBorder = { fg = colors.mauve, bg = colors.mantle },
						FloatTitle = { fg = colors.lavender, bold = true },
						-- ---------------------------------------------------
						-- customs for fzf-lua
						FzfLuaNormal = { bg = colors.mantle }, -- Background of the fzf box
						FzfLuaBorder = { fg = colors.mauve, bg = colors.mantle }, -- The container border
						FzfLuaTitle = { fg = colors.mauve, bg = colors.mantle }, -- Picker title (e.g. "Files")
						FzfLuaBackdrop = { bg = "#000000", blend = 40 },
						-- ---------------------------------------------------
						-- lsp
						LspInfoBorder = { fg = colors.mauve },
						-- ---------------------------------------------------
						-- Picker
						SnacksPickerBorder = { fg = colors.mauve },
						SnacksPickerTitle = { fg = colors.mauve, style = { "bold" } },
						SnacksPickerPrompt = { fg = colors.mauve },
						-- ---------------------------------------------------
						-- Input
						SnacksInputBorder = { fg = colors.mauve },
						SnacksInputTitle = { fg = colors.mauve },
						-- ---------------------------------------------------
						-- Dashboard
						SnacksDashboardHeader = { fg = colors.lavender },
						SnacksDashboardFooter = { fg = colors.overlay1 },
						-- ---------------------------------------------------
						-- Notification
						SnacksNotifierBorderInfo = { fg = colors.mauve },
						SnacksNotifierBorderWarn = { fg = colors.flamingo },
						SnacksNotifierBorderError = { fg = colors.mauve },
						-- ---------------------------------------------------
						-- Noice
						NoiceCmdlinePopupBorder = { fg = colors.mauve },
						NoiceCmdlinePopupTitle = { fg = colors.lavender, bold = true },
						NoicePopupBorder = { fg = colors.mauve },
						NoiceConfirmBorder = { fg = colors.lavender },
						NoicePopupmenuBorder = { fg = colors.mauve, bg = colors.mantle },

						-- ---------------------------------------------------
						-- Telescope
						TelescopeBorder = { fg = colors.mauve },
						TelescopePromptBorder = { fg = colors.mauve },
						TelescopeResultsBorder = { fg = colors.mauve },
						TelescopePreviewBorder = { fg = colors.mauve },

						-- ---------------------------------------------------
						-- scroll bar
						ScrollbarHandle = { fg = colors.mauve, bg = colors.mauve },
						ScrollbarCursor = { fg = colors.lavender, bg = colors.lavender },

						ScrollbarSearch = { fg = colors.pink, bg = colors.pink },
						--
						ScrollbarError = { fg = colors.red, bg = colors.red },
						--
						ScrollbarWarn = { fg = colors.peach, bg = colors.peach },
						--
						ScrollbarInfo = { fg = colors.sky, bg = colors.sky },
						--
						ScrollbarHint = { fg = colors.teal, bg = colors.teal },
						--
						DiagnosticSignError = { fg = colors.red },
						DiagnosticSignWarn = { fg = colors.peach }, -- "peach" fits "purple/orange" beautifully in Catppuccin
						DiagnosticSignInfo = { fg = colors.blue },
						DiagnosticSignHint = { fg = colors.green },
						-- ----------------------------------------------------------
						-- menu
						NormalFloat = { fg = colors.mauve, bg = colors.mantle },
						-- Targets the border of NvZone's context/popup menus directly
						NvChMenuBorder = { fg = colors.mauve, bg = colors.mantle },
						NvChMenuNormal = { bg = colors.mantle, fg = colors.text },

						-- Fallbacks used by the Volt rendering layers
						VoltBorder = { fg = colors.mauve, bg = colors.mantle },
						VoltNormal = { bg = colors.mantle, fg = colors.text },

						-- nvim forceful color for volt menu
						PmenuBorder = { fg = colors.mauve, bg = colors.mantle },

						-- --------------------------------------------------------
						-- cursorline
						CursorLine = { bg = colors.surface0 },
						-- ----------------------------------------------------------
						-- OPTION B: Make the entire box background purple (with dark text)
						-- Remove the comment dashes below if you want a solid purple block:
						-- NoiceCmdlinePopup = { bg = colors.mauve, fg = colors.crust },
						-- NoiceCmdlinePopupBorder = { bg = colors.mauve, fg = colors.mauve
						-- If using mini.notify, you can explicitly map highlights here:
						-- MiniNotifyBorder = { fg = colors.lavender },
						-- MiniNotifyTitle = { fg = colors.mauve, bold = true },

						-- If using nvim-notify, you can explicitly map highlights here:
						-- NotifyInfoBorder = { fg = colors.mauve },
						-- NotifyInfoIcon = { fg = colors.mauve },
						-- MsgArea controls the text and background color of the command line box
						-- MsgArea = {
						-- 	bg = colors.mauve, -- Makes the background Catppuccin's purple
						-- 	fg = colors.crust, -- Makes the text dark so it stays readable on purple
						-- },
						-- -- Optional: Change the visual separator line right above the command line
						-- MsgSeparator = {
						-- 	fg = colors.mantle,
						-- 	bg = colors.mauve,
						-- },
					}
				end,
			})
			-- setup must be called before loading
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
