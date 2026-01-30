vim.opt.termguicolors = true
require("config.lazy")
vim.cmd("set number")
vim.cmd("filetype plugin indent on")
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- my additions
vim.opt.softtabstop = 4
-- vim.opt.termguicolors = true

--Had included in the plugin for neovim-lsp
--vim.lsp.enable('pyright')
--vim.lsp.enable('lua_ls)
-- --- -------------- -----
-- require set-ups -------
-- ---- --------- --------
require("luatab").setup({

	title = function()
		return ""
	end,
	modified = function()
		return ""
	end,
	windowCount = function()
		return ""
	end,
	devicon = function()
		return ""
	end,
	separator = function()
		return ""
	end,
})
