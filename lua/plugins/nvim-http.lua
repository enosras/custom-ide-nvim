return {

	-- {
	-- 	"oysandvik94/curl.nvim",
	-- 	cmd = { "CurlOpen" },
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	config = true,
	-- },
	-- not for http but for highlighting surround blue
	-- --- --------------------
	{
		"kylechui/nvim-surround",
		version = "^4.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		-- Optional: See `:h nvim-surround.configuration` and `:h nvim-surround.setup` for details
		-- config = function()
		--     require("nvim-surround").setup({
		--         -- Put your configuration here
		--     })
		-- end
	},
	-- ---- --
	-- tpopes surround which i used to replace kyle's
	-- {
	-- 	"https://github.com/tpope/vim-surround",
	-- },
}
