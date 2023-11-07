return {
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
		keys = {
			{ "gc", mode = { "n", "v" } },
			{ "gb", mode = { "n", "v" } },
		}
	},

	{
		"tpope/vim-abolish",
		cmd = { "S" },
		keys = {
			{ "cr", mode = { "n" } },
		},
	},

	{
		"tpope/vim-surround",
		dependencies = { { "tpope/vim-repeat" } },
		keys = {
			{ "cs", mode = { "n" } },
			{ "ys", mode = { "n" } },
			{ "ds", mode = { "n" } },
			{ "S",  mode = { "v" } },
		},
	},

	{ "michaeljsmith/vim-indent-object", event = "VeryLazy" },

	{
		"github/copilot.vim",
		event = "InsertEnter",
		init = function()
			vim.cmd([[
				let g:copilot_no_maps = v:true
			]])
		end
	},

	{
		"rgroli/other.nvim",
		config = function()
			require "config/other"
		end,
		cmd = { "Other", "OtherSplit", "OtherVSplit" }
	},

	{
		"tpope/vim-fugitive",
		dependencies = { {
			"tpope/vim-rhubarb",
			config = function()
				vim.api.nvim_create_user_command(
					"Browse",
					function(args)
						vim.ui.open(args.args)
					end,
					{ nargs = 1 }
				)
			end
		} },
		event = "VeryLazy", -- Some commands like `Gdiff` doesn't lazy load it
	},

	{
		"ibhagwan/fzf-lua",
		config = function() require "config/fzf-lua" end,
		cmd = { "FzfLua" },
	},

	{
		"mbbill/undotree",
		cmd = { "UndotreeToggle" },
		config = function() require "config/undotree" end,
	},

	{ "itchyny/vim-qfedit",              ft = { "qf" } },

	-- There is no way to efficiently lazy load it. Even `VeryLazy` doesn't work.
	-- See https://github.com/folke/lazy.nvim/issues/880
	{
		"neovim/nvim-lspconfig",
		config = require("config/nvim-lsp").setup,
		dependencies = {
			{
				"hrsh7th/cmp-nvim-lsp",
				config = function() require("cmp_nvim_lsp").setup {} end,
			},
			{
				"SmiteshP/nvim-navic",
				config = function()
					vim.g.navic_silence = true
					vim.o.winbar = vim.o.winbar .. " %{%v:lua.require'nvim-navic'.get_location()%}"
				end,
			},
		},
	},
	{
		"Wansmer/symbol-usage.nvim",
		config = function()
			local symbolKind = vim.lsp.protocol.SymbolKind

			require("symbol-usage").setup({
				kinds = {
					symbolKind.Function,
					symbolKind.Method,
					symbolKind.Struct,
					symbolKind.Class,
				},
				hl = { link = "NonText" },
				vt_position = "end_of_line",
				implementation = { enabled = true },
			})
		end,
		event = "LspAttach",
	},
	{
		"stevearc/dressing.nvim",
		opts = require("config/dressing"),
		event = "VeryLazy",
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				go = { "gofmt", "goimports" },
				terraform = { "terraform_fmt" },
				["*"] = { "trim_whitespace" },
			},
			format_on_save = {
				timeout_ms = 5000,
				lsp_fallback = true,
			},
		},
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = require("config/noice"),
		dependencies = {
			"MunifTanjim/nui.nvim",
		}
	},

	{
		"psliwka/vim-smoothie",
		keys = { "<C-u>", "<C-d>", "<C-b>", "<C-f>" },
	},

	{
		"jinh0/eyeliner.nvim",
		keys = { "f", "F", "t", "T" },
		opts = {
			highlight_on_key = true,
		},
	},

	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		config = function() require "config/nvim-cmp" end,
		dependencies = {
			{
				"hrsh7th/cmp-nvim-lsp",
				config = function() require("cmp_nvim_lsp").setup {} end,
				dependencies = {
					{
						"neovim/nvim-lspconfig",
						config = require("config/nvim-lsp").setup,
					},
				}
			},
			"hrsh7th/cmp-buffer",
		},
	},

	{
		"lourenci/github-colors",
		config = function()
			vim.cmd.colorscheme("github-colors")
		end,
		lazy = false,
		priority = 1000,
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				disable_in_visualblock = true,
			})
		end,
	},

	{
		"vim-test/vim-test",
		cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" },
		config = function()
			vim.cmd([[
				let test#strategy = "neovim"
				let g:test#neovim#start_normal = 1
			]])
		end,
	},

	{
		'stevearc/oil.nvim',
		config = function()
			require('oil').setup({
				view_options = {
					show_hidden = true,
				},
				skip_confirm_for_simple_edits = true,
				keymaps = require("keymappings").oil,
				use_default_keymaps = false,
			})
		end,
		event = "VeryLazy",
	},

	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = { "markdown" },
	},
	{
		"ferrine/md-img-paste.vim",
		config = function()
			vim.g.mdip_imgdir = "."
			vim.g.mdip_imgdir_intext = "."
		end,
		ft = { "markdown" },
	},
	{
		"folke/zen-mode.nvim",
		cmd = { "ZenMode" },
		config = function() require "config/zenmode" end,
	},

	{ "mechatroner/rainbow_csv", ft = { "csv", "tsv" } },

	{ "vimpostor/vim-lumen",     event = "VeryLazy" },

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = require("config/treesitter").setup,
		ft = require("config/treesitter").filetypes,
	},
	{
		"Wansmer/treesj",
		cmd = { "TSJSplit", "TSJJoin" },
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter",
				config = require("config/treesitter").setup,
			}
		},
		config = function()
			local tsj = require("treesj")
			tsj.setup({
				use_default_keymaps = false,
			})
		end,
	},

	{
		"kevinhwang91/nvim-fundo",
		dependencies = { { "kevinhwang91/promise-async" } },
		build = function() require('fundo').install() end,
		config = true,
	}
}
