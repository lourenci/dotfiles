local cmp = require"cmp"
local snippy = require"snippy"

local kind_icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "󰂡",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
}

cmp.setup({
	snippet = {
		expand = function(args)
			snippy.expand_snippet(args.body)
		end
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "snippy" },
		{
			name = "buffer",
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end
			}
		},
	}),
	mapping = require("keymappings").nvim_cmp(),
	window = {
		documentation = cmp.config.window.bordered(),
	},
	matching = {
		disallow_partial_fuzzy_matching = false,
	},
	formatting = {
		format = function(_, vim_item)
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
			return vim_item
		end
	},
})
