return {
	{"nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
  local configs = require("nvim-treesitter.config")
  configs.setup({
	 ensure_installed ={"lua", "vim", "go", "javascript", "ruby", "python", "html",},
	-- sync_install = true,
	auto_install = true,
	highlight = { enable = true},
	indent = { enable = true },
  	})
	end,
},
}
