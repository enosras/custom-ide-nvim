return {
	{
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("hlslens").setup()

			-- Optional: Setup keymaps as recommended by nvim-hlslens
			local kopts = { noremap = true, silent = true }
			vim.api.nvim_set_keymap(
				"n",
				"=",
				[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
				kopts
			)
			vim.api.nvim_set_keymap(
				"n",
				"#",
				[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
				kopts
			)
			vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
		end,
	},

	{
		"petertriho/nvim-scrollbar",
		-- lazy = true,

		config = function()
			-- ----------- ------------- ---- ----------------
			-- Alternative Setup -------------- -------
			-- ----------------- --------------------------
			-- local colors = require("tokyonight.colors").setup()
			--
			-- require("scrollbar").setup({
			-- 	handle = { color = "blue" },
			-- 	marks = {
			-- 		Search = { color = colors.orange },
			-- 		Error = { color = colors.error },
			-- 		Warn = { color = colors.warning },
			-- 		Info = { color = colors.info },
			-- 		Hint = { color = colors.hint },
			-- 		Misc = { color = colors.purple },
			-- 	},
			-- })

			--	require("scrollbar").setup({

			require("scrollbar").setup({

				-- your configuration options here
				-- e.g.
				handle = { color = "orange" },
				marks = {
					DiagnosticSignError = { color = "red" },
					DiagnosticSignWarn = { color = "yellow" },
					DiagnosticSignInfo = { color = "blue" },
					DiagnosticSignHint = { color = "green" },
					-- ``
				},
			})
		end,
	},
}
