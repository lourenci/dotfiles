return {
	lsp = {
		progress = {
			enabled = false,
		},
	},
	presets = {
		lsp_doc_border = true,
		long_message_to_split = true,
	},
	routes = {
		-- show register contents in a popup
		{
			view = "popup",
			filter = {
				event = "msg_show",
				kind = "",
				find = "Type Name Content",
			},
		},
		{
			view = "notify",
			filter = { event = "msg_showmode" },
		},
	},
	views = {
		mini = {
			border = {
				style = "rounded",
			},
			position = {
				row = -2,
			},
		},
	},
}
