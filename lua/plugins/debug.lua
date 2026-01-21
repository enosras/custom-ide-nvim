return {

	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
		"mfussenegger/nvim-dap-python",
		"suketa/nvim-dap-ruby",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		require("dapui").setup()
		require("dap-go").setup()
		require("dap-ruby").setup()
		require("dap-python").setup("python3")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		-- the combination below useful for creating a debug break point for self organization during development
		vim.keymap.set("n", "<leader>ew", dap.toggle_breakpoint, {})
		-- the keystrokes below lead to a debug console
		vim.keymap.set("n", "<leader>er", dap.continue, {})
	end,
}
