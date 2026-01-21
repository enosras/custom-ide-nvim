return {
	{
		"nvim-treesitter/nvim-treesitter",
		--	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		lazy = false,
		build = ":TSUpdate",
		config = function(_, opts)
			require("nvim-treesitter.config").setup({
				ensure_installed = {
					"c",
					"markdown",
					"lua",
					"vim",
					"go",
					"javascript",
					"ruby",
					"python",
					"html",
					"rust",
					"cpp",
				},
				-- sync_install = true,
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
