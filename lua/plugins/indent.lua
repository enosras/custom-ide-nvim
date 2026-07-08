return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		indent = { enabled = true },
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = true },
		input = { enabled = true },
		picker = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		terminal = { enabled = true },
		zen = { enabled = true },
	},
	keys = {
		-- Find files and text (replaces Telescope)
		{
			"<leader><space>",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep Text",
		},
		{
			"<leader>sb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Grep Buffers",
		},

		-- File Explorer
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},

		-- Floating Terminal
		{
			"<leader>ft",
			function()
				Snacks.terminal.toggle()
			end,
			desc = "Toggle Terminal",
		},

		-- Zen Mode
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Toggle Zen Mode",
		},

		-- Notification History
		{
			"<leader>un",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
	},
}
