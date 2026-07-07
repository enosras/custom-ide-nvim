return {
	{
		"nvim-treesitter/nvim-treesitter",
		--	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		lazy = false,
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"dockerfile",
				"groovy",
				"hcl",
				"terraform",
				"c",
				"markdown",
				"lua",
				"vim",
				"go",
				"kotlin",
				"javascript",
				"ruby",
				"python",
				"html",
				"rust",
				"cpp",
				"bash",
				"yaml",
				"zig",
				"awk",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		},
		config = function(_, opts)
			require("nvim-treesitter").setup(opts)
		end,
	},
}
