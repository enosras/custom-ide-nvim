return {
	{
		"rrethy/vim-hexokinase",
		build = "make hexokinase", -- compile the binary after install/update
		config = function()
			-- choose how you want the colors displayed
			vim.g.Hexokinase_highlighters = { "virtual", "foreground", "background", "sign_column" }
		end,
	},
	{
		"xzbdmw/colorful-menu.nvim",
		lazy = false,
		config = function()
			-- You don't need to set these options.
			require("colorful-menu").setup({})
		end,
	},
}
