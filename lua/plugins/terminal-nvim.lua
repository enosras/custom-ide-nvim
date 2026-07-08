return {
	"norcalli/nvim-terminal.lua",
	opts = {},
	config = function(_, opts)
		require("terminal").setup(opts)
	end,
}
