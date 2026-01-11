return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"s1n7ax/nvim-window-picker",
			"folke/snacks.nvim",
			-- "nvim-neo-tree/nvim-neo-tree-ui",
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			"antosha417/nvim-lsp-file-operations",
			"3rd/image.nvim", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
	},

	-- vim.keymap.set("n", "<leader>nl", ":Neotree filesystem reveal left<CR>", {}),
	-- config = function ()
	--  require('neo-tree').setup({
	-- options g here
	--})
}
