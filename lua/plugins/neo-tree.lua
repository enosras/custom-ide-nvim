return {
	{ "3rd/image.nvim" },
	lazy = false,
	config = true,
	-- opts = {
	-- 	backend = "kitty", -- or "ueberzug" / "sixel" depending on your terminal
	-- 	integrations = {
	-- 		markdown = {
	-- 			enabled = true,
	-- 			clear_in_insert_mode = false,
	-- 			download_remote_images = true,
	-- 			only_render_image_at_cursor = false,
	-- 			floating_windows = false,
	-- 		},
	-- 		neorg = {
	-- 			enabled = true,
	-- 		},
	-- 		html = {
	-- 			enabled = false,
	-- 		},
	-- 		css = {
	-- 			enabled = false,
	-- 		},
	-- 	},
	-- 	max_width = nil,
	-- 	max_height = nil,
	-- 	max_width_window_percentage = nil,
	-- 	max_height_window_percentage = 50,
	-- 	window_overlap_clear_enabled = false,
	-- 	window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "Directive" },
	-- 	editor_only_render_when_focused = false,
	-- 	tmux_show_only_in_active_window = false,
	-- 	hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- open image files directly
	-- },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"s1n7ax/nvim-window-picker",
			"folke/snacks.nvim",
			-- "nvim-neo-tree/nvim-neo-tree-ui",
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			"antosha417/nvim-lsp-file-operations",
			"3rd/image.nvim", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
	},

	-- vim.keymap.set("n", "<leader>nl", ":Neotree filesystem reveal left<CR>", {}),
	-- config = function ()
	--  require('neo-tree').setup({
	-- options g here
	--})
}
