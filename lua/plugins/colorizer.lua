return {
	"rrethy/vim-hexokinase",
	build = "make hexokinase", -- compile the binary after install/update
	config = function()
		-- choose how you want the colors displayed
		vim.g.Hexokinase_highlighters = { "virtual", "foreground", "background", "sign_column" }
	end,
}
