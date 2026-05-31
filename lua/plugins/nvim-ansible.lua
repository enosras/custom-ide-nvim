return {
	{ "pearofducks/ansible-vim" },

	{
		"mfussenegger/nvim-ansible",
		dependencies = { "neovim/nvim-lspconfig" },
		--	ft = { "yaml.ansible" },
		keys = {
			{
				"<leader>T",
				function()
					require("ansible").run()
				end,
				ft = "yaml.ansible",
				desc = "Ansible Run Playbook/Role",
				silent = true,
			},
		},
	},

	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				["yaml.ansible"] = { "ansible-lint" },
				-- python = { 'ruff' },
			}
			-- Automatically run linter on save.
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
