local actions = require("fzf-lua.actions")

require'fzf-lua'.setup({
	winopts = {
		height       = 0.90,
		width        = 0.95,
		preview = {
			layout = 'vertical',
		},
	},
	keymap = {
		builtin = require("keymappings").fzf,
	},
	grep = {
		actions = {
			["default"] = actions.file_edit_or_qf,
		},
	},
	oldfiles = {
		cwd_only          = true,
		include_current_session = true,
	},
})
