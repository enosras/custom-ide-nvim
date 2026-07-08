vim.opt.termguicolors = true
require("config.lazy")
-- vim.cmd("set number")
-- same as the one above but it is in vimscript
vim.o.number = true
vim.cmd("filetype plugin indent on")
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
-- vim.opt.background = "light" -- light
vim.opt.background = "dark"
vim.cmd("set t_ut=")

-- my additions
vim.opt.softtabstop = 4
-- vim.wo.conceallevel = 2
vim.opt.conceallevel = 2
vim.o.winborder = "rounded"
vim.o.pumborder = "single"
-- vim.bo.conceallevel = 2
-- vim.opt.termguicolors = true

-- Disables the plain native right-click popup menu entirel ey
-- vim.cmd.aunmenu("PopUp")

-- Clear out the built-in popup menu event handler group
-- vim.api.nvim_clear_autocmds({ group = "nvim.popupmenu" })

-- Hook directly into the nvzone/menu execution to override its textures on-demand
local menu_module = require("menu")
local original_menu_open = menu_module.open

-- menu_module.open = function(menu_type, opts)
-- original_menu_open = function(menu_type, opts)
menu_module.open = function(menu_type, opts)
	opts = opts or {}
	opts.border = true -- Locks down the physical grid tracks

	-- Execute the core window generation first
	original_menu_open(menu_type, opts)

	-- FIX: Instantly scrub the window canvas before the terminal renders it
	local colors = require("catppuccin.palettes").get_palette("mocha") -- Change to your active variant (e.g., macchiato)

	-- Force absolute opacity and color lock across the plugin's layout nodes
	vim.api.nvim_set_hl(0, "NvMenuNormal", { bg = colors.base, fg = colors.teal, blend = 0 })
	vim.api.nvim_set_hl(0, "NvMenuBorder", { fg = colors.mauve, bg = colors.base, blend = 0 })
	vim.api.nvim_set_hl(0, "NvMenuSelected", { bg = colors.mantle, fg = colors.teal, bold = true })

	-- Force the active menu window layout options directly
	local current_win = vim.api.nvim_get_current_win()
	vim.wo[current_win].winblend = 0
	vim.wo[current_win].winhighlight = "Normal:NvMenuNormal,FloatBorder:NvMenuBorder"
end
