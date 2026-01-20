return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			vim.keymap.set("n", "<leader>eg", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>eb", ":Gitsigns toggle_current_line_break<CR>", {})
		end,
	},
	{},
}
