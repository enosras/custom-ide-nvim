return {
	"mason-org/mason.nvim",
	opts = {
		ensure_installed = {
			"tflint",
			"ansible-lint",
			"ruff",
			"yamlfix",
			"eslint",
			"black",
			"ktlint",
			"js-debug-adapter",
			{ "erb-formatter", "erb-lint" },
		},
	},

	config = function()
		require("mason").setup({})
	end,
}
