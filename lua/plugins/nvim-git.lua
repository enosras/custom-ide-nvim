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
	{
		"NeogitOrg/neogit",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			-- "nvim-telescope/telescope.nvim", -- optional
			-- "ibhagwan/fzf-lua", -- optional
			-- "nvim-mini/mini.pick", -- optional
			"folke/snacks.nvim", -- optional
		},
		cmd = "Neogit",
		--  require('neogit').setup {},
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
		},
	},
}
