return {
	"stevearc/stickybuf.nvim",
	opts = {},
	config = function()
		require("stickybuf").setup({
			get_auto_pin = function(bufnr)
				local filetype = vim.bo[bufnr].filetype
				-- Example: Don't stick or monitor toggleterm or neo-tree windows
				if filetype == "toggleterm" or filetype == "neo-tree" then
					return nil
				end
				return require("stickybuf").should_auto_pin(bufnr)
			end,
		})
	end,
}
