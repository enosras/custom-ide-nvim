return {
	"saghen/blink.cmp",
	lazy = false,
	dependencies = {
		"rafamadriz/friendly-snippets",
		"moyiz/blink-emoji.nvim",
		"ray-x/cmp-sql",
		"saghen/blink.compat",
		"dmitmel/cmp-digraphs",
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
		"onsails/lspkind.nvim",
	},
	version = "1.*",
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = { preset = "default" },
		appearance = {
			use_nvim_cmp_as_default = false,
			nerd_font_variant = "mono",
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
		},
		-- (Default) Only show the documentation popup when manually triggered
		completion = {
			accept = { auto_brackets = { enabled = true } },
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 250,
				treesitter_highlighting = true,
				window = { border = "rounded" },
			},
			ghost_text = {
				enabled = vim.g.ai_cmp,
			},
			menu = {
				border = "rounded",
				draw = {
					treesitter = { "lsp" },
					columns = {
						{ "kind_icon", "label", gap = 1 },
						{ "kind" },
					},
					components = {
						kind_icon = {
							text = function(item)
								local kind = require("lspkind").symbol_map[item.kind] or ""
								return kind .. " "
							end,
							highlight = "CmpItemKind",
						},
						label = {
							text = function(item)
								return item.label
							end,
							highlight = "CmpItemAbbr",
						},
						kind = {
							text = function(item)
								return item.kind
							end,
							highlight = "CmpItemKind",
						},
					},
				},
			},
		},
		signature = { enabled = true, window = { border = "rounded" } },

		sources = {
			compat = {},
			default = { "lsp", "path", "snippets", "buffer", "emoji" },
			providers = {
				-- og souces --
				lsp = {
					min_keyword_length = 2, -- Number of characters to trigger porvider
					score_offset = 0, -- Boost/penalize the score of the items
				},
				path = {
					min_keyword_length = 0,
				},
				snippets = {
					min_keyword_length = 2,
				},
				buffer = {
					min_keyword_length = 5,
					max_items = 5,
				},
				-- lazy dev --
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100, -- show at a higher priority than lsp
				},

				--end here
				emoji = {
					module = "blink-emoji",
					name = "Emoji",
					score_offset = 15, -- Tune by preference
					opts = { insert = true }, -- Insert emoji (default) or complete its name
					should_show_items = function()
						return vim.tbl_contains(
							-- Enable emoji completion only for git commits and markdown.
							-- By default, enabled for all file-types.
							{ "gitcommit", "markdown" },
							vim.o.filetype
						)
					end,
				},
				-- create provider
				digraphs = {
					-- IMPORTANT: use the same name as you would for nvim-cmp
					name = "digraphs",
					module = "blink.compat.source",

					-- all blink.cmp source config options work as normal:
					score_offset = -3,
					opts = {
						-- this is an option from cmp-digraphs
						cache_digraphs_on_start = true,
					},
				},

				-- sql provider, might delete later
				sql = {
					-- IMPORTANT: use the same name as you would for nvim-cmp
					name = "sql",
					module = "blink.compat.source",

					-- all blink.cmp source config options work as normal:
					score_offset = -3,

					-- this table is passed directly to the proxied completion source
					-- as the `option` field in nvim-cmp's source config
					--
					-- this is NOT the same as the opts in a plugin's lazy.nvim spec
					opts = {},
					should_show_items = function()
						return vim.tbl_contains(
							-- Enable emoji completion only for git commits and markdown.
							-- By default, enabled for all file-types.
							{ "sql" },
							vim.o.filetype
						)
					end,
				},

				-- closing providers now
				--
			},
		},

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
