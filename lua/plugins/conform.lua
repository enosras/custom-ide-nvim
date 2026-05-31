return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	lazy = false,
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black", lsp_format = "fallback" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			rust = { "rustfmt", lsp_format = "fallback" },
			-- Conform will run the first available formatter
			javascript = { "prettierd", "prettier", stop_after_first = true },
			go = { "gofmt", lsp_format = "fallback" },
			c = { "clang_format", lsp_format = "fallback" },
			html = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
			cpp = { "clang_format", lsp_format = "fallback" },
			terraform = { "terraform_fmt" },
			tf = { "terraform_fmt" },
			hcl = { "hclfmt", "packer_fmt" },
			["yaml.ansible"] = { "ansible_lint", lsp_format = "fallback" },
		},
	},
}
