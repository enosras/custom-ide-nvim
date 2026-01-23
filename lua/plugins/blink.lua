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
		"Kaiser-Yang/blink-cmp-git",
		{ "ribru17/blink-cmp-spell" },
		{
			"Kaiser-Yang/blink-cmp-dictionary",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
		{ "archie-judd/blink-cmp-words" },
	},
	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		snippets = { preset = "luasnip" },
		keymap = { preset = "default" },
		cmdline = {
			keymap = { preset = "inherit" },
			completion = {
				menu = { auto_show = true },
				ghost_text = { enabled = true },
			},
		},
		appearance = {
			use_nvim_cmp_as_default = false,
			nerd_font_variant = "mono",
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
		},
		-- (Default) Only show the documentation popup when manually triggered
		completion = {
			accept = { auto_brackets = { enabled = true } },
			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},
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
				scrollbar = true,
				border = "rounded",
				draw = {
					treesitter = { "lsp" },
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 1 },
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
			per_filetype = {
				lua = { inherit_defaults = true, "lazydev" },
			},
			--  for compat sources --
			compat = {},
			-- the og defaults entry --
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
				"emoji",
				"git",
				"digraphs",
				"spell",
				"dictionary",
				"lazydev",
				"thesaurus",
			},
			providers = {
				--thesarus--
				thesaurus = {
					name = "blink-cmp-words",
					module = "blink-cmp-words.thesaurus",
					enabled = false,
					-- All available options
					opts = {
						-- A score offset applied to returned items.
						-- By default the highest score is 0 (item 1 has a score of -1, item 2 of -2 etc..).
						score_offset = 0,

						-- Default pointers define the lexical relations listed under each definition,
						-- see Pointer Symbols below.
						-- Default is as below ("antonyms", "similar to" and "also see").
						definition_pointers = { "!", "&", "^" },

						-- The pointers that are considered similar words when using the thesaurus,
						-- see Pointer Symbols below.
						-- Default is as below ("similar to", "also see" }
						similarity_pointers = { "&", "^" },

						-- The depth of similar words to recurse when collecting synonyms. 1 is similar words,
						-- 2 is similar words of similar words, etc. Increasing this may slow results.
						similarity_depth = 2,
					},
				},
				-- dictionary --
				dictionary = {
					module = "blink-cmp-dictionary",
					name = "Dict",
					-- Make sure this is at least 2.
					-- 3 is recommended
					min_keyword_length = 3,
					enabled = false,
					opts = {
						dictionary_files = { vim.fn.expand("~/.config/nvim/dictionary/words.txt") },
						dictionary_directories = { vim.fn.expand("~/.config/nvim/dictionary") },
						-- options for blink-cmp-dictionary
					},
				},

				-- git source
				git = {
					module = "blink-cmp-git",
					name = "Git",
					--- @module 'blink-cmp-git'
					--- @type 'blink-cmp-git.Options'

					opts = {
						commit = {
							insert_text_trailing = " ",
							-- You may want to customize when it should be enabled
							-- The default will enable this when `git` is found and `cwd` is in a git repository
							-- enable = function() end
							-- You may want to change the triggers
							-- triggers = { ':' },
							--#
							-- use the first 7 hash and the first line of the commit message as the label
							get_label = function(item)
								-- For `octo.nvim` users, the `item` is a table
								if type(item) == "table" then
									return item.sha:sub(1, 7) .. " " .. item.commit.message:match("([^\n]*)")
								end
								return item:match("commit ([^\n]*)"):sub(1, 7) .. " " .. item:match("\n\n%s*([^\n]*)")
							end,
							-- use 'Commit' as the kind name
							get_kind_name = function(_)
								return "Commit"
							end,
							-- use the first 7 hash as the insert text
							get_insert_text = function(item)
								-- For `octo.nvim` users, the `item` is a table
								if type(item) == "table" then
									return item.sha:sub(1, 7)
								end
								return item:match("commit ([^\n]*)"):sub(1, 7)
							end,
							-- use the whole commit message as the documentation
							get_documentation = function(item)
								-- For `octo.nvim` users, the `item` is a table
								if type(item) == "table" then
									return "commit "
										.. item.sha
										.. "\n"
										.. "Author:     "
										.. item.commit.author.name
										.. " <"
										.. item.commit.author.email
										.. ">\n"
										.. "AuthorDate: "
										.. item.commit.author.date
										.. "\n"
										.. "Commit:     "
										.. item.commit.committer.name
										.. " <"
										.. item.commit.committer.email
										.. ">\n"
										.. "CommitDate: "
										.. item.commit.committer.date
										.. "\n"
										.. item.commit.message
								end
								return item
								-- or you can use `blink-cmp-git.DocumentationCommand` to get the documentation
								-- return {
								--     -- the command to get the documentation
								--     get_command = '',
								--     get_command_args = {}
								--     -- how to resolve the output
								--     resolve_documentation = function(output) return output end
								-- }
								-- or return nil to disable the documentation
								-- return nil
							end,
						},
						git_centers = {
							github = {
								-- Those below have the same fields with `commit`
								-- Those features will be enabled when `git` and `gh` (or `curl`) are found and
								-- remote contains `github.com`
								-- issue = {
								--     get_token = function() return '' end,
								-- },
								-- pull_request = {
								--     get_token = function() return '' end,
								-- },
								-- mention = {
								--     get_token = function() return '' end,
								--     get_documentation = function(item)
								--         local default = require('blink-cmp-git.default.github')
								--             .mention.get_documentation(item)
								--
								--         default.get_token = function() return '' end
								--         return default
								--     end
								-- }
							},
						},
						-- options for the blink-cmp-git
					},
				},
				-- old guard (OG) sources --
				lsp = {
					name = "LSP",
					fallbacks = {},
					override = nil,
					module = "blink.cmp.sources.lsp",
					opts = {},
					min_keyword_length = 1, -- Number of characters to trigger provider
					score_offset = 0, -- Boost/penalize the score of the items
					enabled = true, -- Whether or not to enable the provider
					async = false, -- Whether we should show the completions before this provider returns, without waiting for it
					timeout_ms = 2000, -- How long to wait for the provider to return before showing completions and treating it as asynchronous
					transform_items = nil, -- Function to transform the items before they're returned
					should_show_items = true, -- Whether or not to show the items
					max_items = nil,
				},
				path = {
					min_keyword_length = 0,
				},
				snippets = {
					-- friendly_snippets = false,
					min_keyword_length = 2,
				},
				buffer = {
					min_keyword_length = 4,
					max_items = 5,
				},
				-- lazy dev --
				lazydev = {
					name = "LazyDev",
					enabled = true,
					module = "lazydev.integrations.blink",
					score_offset = 100, -- show at a higher priority than lsp
				},
				-- lazy dev ends here
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
					enabled = false,

					-- all blink.cmp source config options work as normal:
					score_offset = -3,
					opts = {
						-- this is an option from cmp-digraphs
						cache_digraphs_on_start = true,
					},
				},
				-- spell source --
				spell = {
					name = "Spell",
					module = "blink-cmp-spell",
					opts = {

						-- EXAMPLE: Only enable source in `@spell` captures, and disable it
						-- in `@nospell` captures.
						-- enable_in_context = function()
						-- 	local curpos = vim.api.nvim_win_get_cursor(0)
						-- 	local captures = vim.treesitter.get_captures_at_pos(0, curpos[1] - 1, curpos[2] - 1)
						-- 	local in_spell_capture = false
						-- 	for _, cap in ipairs(captures) do
						-- 		if cap.capture == "spell" then
						-- 			in_spell_capture = true
						-- 		elseif cap.capture == "nospell" then
						-- 			return false
						-- 		end
						-- 	end
						-- 	return in_spell_capture
						-- end,
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
