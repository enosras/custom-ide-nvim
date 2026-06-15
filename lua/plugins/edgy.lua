return {
	{
		"folke/edgy.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"hyperstown/hacks.nvim",
		lazy = false,
		opts = {
			-- some plugins require to be enabled
			inline_js_ls = { enabled = true }, -- requires node and npm to be installed
			pdf = { enabled = true },
			mouse = { enabled = true },
			colorify = { enabled = true },
		},
	},
}
