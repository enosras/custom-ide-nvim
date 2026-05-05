return {
	"mason-org/mason.nvim",
	opts = {
		ensure_installed = { "ansible-lint", "ruff", "yamlfix", "black", "ktlint" },
	},

	config = function()
		require("mason").setup({})
	end,
}
