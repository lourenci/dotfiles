return {
	setup = function()
		require "nvim-treesitter.configs".setup({
			ensure_installed = "all",
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		})

		vim.treesitter.language.register("html", "gohtml")
		vim.treesitter.language.register("terraform", "terraform-vars")
	end,
}
