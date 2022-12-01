require("other-nvim").setup({
	rememberBuffers = false,
	showMissingFiles = false,
	mappings = {
		"golang",
		{
			pattern = "(.+)%.go",
			target = "%1_integration_test%.go",
		},
		{
			pattern = "(.+)_integration_test%.go",
			target = "%1%.go",
		},
	}
})
