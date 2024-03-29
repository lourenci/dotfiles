return {
	setup = function()
		vim.g.mapleader = " "

		local opts = { noremap = true, silent = true }

		vim.api.nvim_set_keymap("n", "[Q", "<cmd>cfirst<CR>", opts)
		vim.api.nvim_set_keymap("n", "]q", "<cmd>cnext<CR>", opts)
		vim.api.nvim_set_keymap("n", "[q", "<cmd>cprev<CR>", opts)
		vim.api.nvim_set_keymap("n", "]Q", "<cmd>clast<CR>", opts)
		vim.api.nvim_set_keymap("n", "[L", "<cmd>lfirst<CR>", opts)
		vim.api.nvim_set_keymap("n", "]l", "<cmd>lnext<CR>", opts)
		vim.api.nvim_set_keymap("n", "[l", "<cmd>lprev<CR>", opts)
		vim.api.nvim_set_keymap("n", "]L", "<cmd>llast<CR>", opts)
		vim.api.nvim_set_keymap("n", "[A", "<cmd>first<CR>", opts)
		vim.api.nvim_set_keymap("n", "]a", "<cmd>next<CR>", opts)
		vim.api.nvim_set_keymap("n", "[a", "<cmd>prev<CR>", opts)
		vim.api.nvim_set_keymap("n", "]A", "<cmd>last<CR>", opts)

		vim.api.nvim_set_keymap("n", "<Leader>;", "<cmd>tabe <bar> :terminal<CR>", opts)

		vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-n><C-l>i", { noremap = false, silent = true })
		vim.api.nvim_set_keymap("t", "<C-b>", "<C-\\><C-n><C-b>", opts)

		vim.api.nvim_set_keymap("v", "<leader>rp", "*N:,$s~<C-r>/~<C-r>/~gc|1,''-&&<c-f>F~;<right>xxvt~",
			{ noremap = false, silent = true })


		-- See `:help vim.lsp.*` for documentation on any of the below functions
		-- Defaults from https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
		vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "v", "n" }, "<leader>ca", vim.lsp.buf.code_action)
		vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references({ includeDeclaration = false }) end, opts)
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, opts)
		vim.keymap.set("n", "<leader>dq", vim.diagnostic.setqflist, opts)

		-- running tests
		vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>TestNearest<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>TestFile<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>tl", "<cmd>TestLast<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>ts", "<cmd>TestSuite<CR>", opts)

		vim.api.nvim_set_keymap("n", "<Leader>u", "<cmd>:UndotreeToggle<cr>", opts)

		vim.api.nvim_set_keymap("n", "<Leader>p", "<cmd>FzfLua files<CR>", opts)
		vim.api.nvim_set_keymap("n", "<Leader>9", "<cmd>FzfLua git_status<CR>", opts)
		vim.api.nvim_set_keymap("n", "<Leader>/", "<cmd>FzfLua grep search=<CR>", opts)
		vim.api.nvim_set_keymap("n", "<Leader>.", "<cmd>FzfLua oldfiles<CR>", opts)
		vim.api.nvim_set_keymap("n", "<Leader>,", "<cmd>FzfLua buffers<CR>", opts)
		vim.api.nvim_set_keymap("n", "<Leader>o", "<cmd>FzfLua lsp_document_symbols<CR>", opts)
		vim.api.nvim_set_keymap("n", "<Leader>:", "<cmd>FzfLua commands<CR>", opts)

		vim.keymap.set("n", "gS", "<cmd>TSJSplit<CR>", opts)
		vim.keymap.set("n", "gJ", "<cmd>TSJJoin<CR>", opts)

		vim.keymap.set({ 'i', 's' }, '<C-l>', function()
			if vim.snippet.jumpable(1) then
				return '<cmd>lua vim.snippet.jump(1)<cr>'
			else
				return '<cmd>lua require("copilot.suggestion").accept()<cr>'
			end
		end, { expr = true })
		vim.keymap.set({ 'i', 's' }, '<C-h>', function()
			if vim.snippet.jumpable(-1) then
				return '<cmd>lua vim.snippet.jump(-1)<cr>'
			else
				return '<C-h>'
			end
		end, { expr = true })

		vim.keymap.set({ "n", "i", "s" }, "<Down>", function()
			require("noice.lsp").scroll(4)
		end, { silent = true })

		vim.keymap.set({ "n", "i", "s" }, "<Up>", function()
			require("noice.lsp").scroll(-4)
		end, { silent = true })

		vim.keymap.set("n", "<Leader>n", "<cmd>New<CR>", opts)
	end,
	oil = {
		["g?"] = "actions.show_help",
		["<CR>"] = "actions.select",
		["<2-LeftMouse>"] = "actions.select",
		["<C-p>"] = "actions.preview",
		["-"] = "actions.parent",
		["!"] = "actions.open_cmdline",
	},
	nvim_cmp = function()
		local cmp = require "cmp"

		return cmp.mapping.preset.insert({
			['<Down>'] = {
				i = cmp.mapping.scroll_docs(4),
			},
			['<Up>'] = {
				i = cmp.mapping.scroll_docs(-4),
			},
		})
	end,
	fzf = {
		["<down>"] = "preview-page-down",
		["<up>"]   = "preview-page-up",
	},
	gitsigns = function(bufnr)
		local gs = package.loaded.gitsigns

		vim.keymap.set("n", "]c", function()
			if vim.wo.diff then return "]c" end
			vim.schedule(function() gs.next_hunk() end)
			return "<Ignore>"
		end, { expr = true, buffer = bufnr })

		vim.keymap.set("n", "[c", function()
			if vim.wo.diff then return "[c" end
			vim.schedule(function() gs.prev_hunk() end)
			return "<Ignore>"
		end, { expr = true, buffer = bufnr })

		vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr })
		vim.keymap.set("v", "<leader>hr", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end,
			{ buffer = bufnr })
		vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr })
	end
}
