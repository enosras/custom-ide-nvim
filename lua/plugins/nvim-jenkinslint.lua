return {
	{
		"ckipp01/nvim-jenkinsfile-linter",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- this here is for docker files
	{
		"jedrzejboczar/devcontainers.nvim",
		dependencies = {
			-- "netman.nvim", -- optional to browse files in docker container
		},
		opts = {},
	},
}
