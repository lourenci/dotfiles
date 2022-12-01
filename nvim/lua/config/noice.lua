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
	messages = {
		view_search = false,
	},
}
