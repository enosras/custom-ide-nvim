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
-- vim.bo.conceallevel = 2
-- vim.opt.termguicolors = true

--Had included in the plugin for neovim-lsp
--vim.lsp.enable('pyright')
--vim.lsp.enable('lua_ls)
-- --- -------------- -----
-- require set-ups -------
-- ---- --------- --------
-- require("luatab").setup({
--
-- 	title = function()
-- 		return ""
-- 	end,
-- 	modified = function()
-- 		return ""
-- 	end,
-- 	windowCount = function()
-- 		return ""
-- 	end,
-- 	devicon = function()
-- 		return ""
-- 	end,
-- 	separator = function()
-- 		return ""
-- 	end,
-- })
