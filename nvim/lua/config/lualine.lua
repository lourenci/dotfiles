local function macro_recording()
	local recording_register = vim.fn.reg_recording()
	if recording_register == "" then
		return ""
	else
		return "󰧔 " .. recording_register
	end
end

return {
	options = {
		section_separators = "",
		component_separators = "",
	},
	sections = {
		lualine_a = {
			{
				"filetype",
				colored = true,
				icon_only = true,
				icon = { align = "right" },
			},
			{
				"filename",
				path = 1,
			}
		},
		lualine_b = { macro_recording },
		lualine_c = {},
		lualine_x = {
			"selectioncount",
			"searchcount",
			{
				"diagnostics",
				diagnostics_color = {
					error = "DiagnosticSignError",
					warn  = "DiagnosticSignWarn",
					info  = "DiagnosticSignInfo",
					hint  = "DiagnosticSignHint",
				},
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
		},
		lualine_y = {
			"progress",
		},
		lualine_z = { "location" },
	},
}
