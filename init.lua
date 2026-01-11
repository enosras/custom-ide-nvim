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
vim.opt.termguicolors = true
--vim.g.mapleader = " "

--Had included in the plugin for neovim-lsp
--vim.lsp.enable('pyright')
--vim.lsp.enable('lua_ls)
