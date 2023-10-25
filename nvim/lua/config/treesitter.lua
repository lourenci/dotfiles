return {
	setup = function ()
		require"nvim-treesitter.configs".setup({
			ensure_installed = {
				"bash",
				"comment",
				"css",
				"dockerfile",
				"git_rebase",
				"gitattributes",
				"gitignore",
				"gitcommit",
				"go",
				"gomod",
				"gowork",
				"graphql",
				"html",
				"java",
				"javascript",
				"json",
				"jsonc",
				"json5",
				"lua",
				"make",
				"markdown",
				"markdown_inline",
				"nix",
				"regex",
				"ruby",
				"scss",
				"sql",
				"tsx",
				"terraform",
				"typescript",
				"vim",
				"yaml",
			},
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		})

		vim.treesitter.language.register("html", "gohtml")
	end,
	filetypes = {
		"bash",
		"css",
		"dockerfile",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"gitrebase",
		"go",
		"gohtml",
		"gomod",
		"gowork",
		"graphql",
		"help",
		"html",
		"java",
		"javascript",
		"javascriptreact",
		"json",
		"lua",
		"make",
		"markdown",
		"nix",
		"ruby",
		"scss",
		"sh",
		"sql",
		"terraform",
		"terraform-vars",
		"tsx",
		"typescript",
		"typescriptreact",
		"vim",
		"yaml",
	}
}