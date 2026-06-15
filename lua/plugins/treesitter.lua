return {
	{
		"nvim-treesitter/nvim-treesitter",
		--	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		lazy = false,
		build = ":TSUpdate",
		config = function(_, opts)
			require("nvim-treesitter.config").setup({
				ensure_installed = {
					"dockerfile",
					"groovy",
					"hcl",
					"terraform",
					"c",
					"markdown",
					"lua",
					"vimscript",
					"go",
					"kotlin",
					"javascript",
					"ruby",
					"python",
					"html",
					"rust",
					"cpp",
					"bash",
					"ansible-language-server",
					"zig",
					"awk-language-server",
				},
				-- sync_install = true,
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
