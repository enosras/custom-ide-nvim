return {
	{ "nvzone/volt", lazy = true },
	{
		"nvzone/menu",
		lazy = true,
		dependencies = "nvzone/volt",
		opts = { border = true },
		vim.keymap.set("n", "<leader>mn", function()
			require("menu").open("default", opts)
		end, {}),
	},
}
