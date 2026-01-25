return {
	{ "nvzone/volt", lazy = true },
	{
		"nvzone/menu",
		lazy = true,
		dependencies = { "nvzone/volt", "nvim-neo-tree/neo-tree.nvim" },
		-- opts = { border = true },
		vim.keymap.set("n", "<leader>mn", function()
			require("menu").open("default", { border = true })
		end, {}),

		vim.keymap.set("n", "<leader>mm", function()
			require("menu").open("neo-tree")
		end, {}),

		-- vim.api.nvim_create_autocmd("FileType", {
		-- 	pattern = "neo-tree",
		-- 	callback = function()
		-- 		vim.keymap.set("n", "<RightMouse>", function()
		-- 			-- open menu logic (buffer-local mapping)
		-- 		end, { buffer = true })
		-- 	end,
		-- }),
		-- vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
		-- 	require("menu.utils").delete_old_menus()
		--
		-- 	vim.cmd.exec('"normal! \\<RightMouse>"')
		--
		-- 	-- clicked buf
		-- 	local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
		-- 	local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"
		--
		-- 	require("menu").open(options, { mouse = true , })
		-- end, {}),
	},
}
