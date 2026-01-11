return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		{ "<leader>eq", "<cmd>AutoSession search<CR>", desc = "Session search" },
		{ "<leader>ea", "<cmd>AutoSession save<CR>", desc = "Save session" },
		{ "<leader>ez", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
	},

	config = function()
		-- Set the vim option here
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

		require("auto-session").setup({
			suppress_dirs = { "~/Projects", "~/Downloads" },
			session_lens = {
				buftypes_to_ignore = {},
				load_on_setup = true,
				picker_opts = { border = true },
				previewer = true,
			},

			-- this is just to show a break in the code. if it fails, restore by commenting the block below
			picker_opts = {
				-- For Telescope, you can set theme options here, see:
				--https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt#L112
				--https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/themes.lua
				border = true,
				layout_config = {
					width = 0.8, -- Can set width and height as percent of window
					height = 0.5,
				},
			},
			--  load_on_setup = true,
		})
	end,
}

--- session_lens = {
--  buftypes_to_ignore = {},
--   load_on_setup = true,
--   picker_opts = {
--     border = true
--   },
--   previewer = false
-- },
-- suppress_dirs = { "~/Projects", "~/Downloads" }--
