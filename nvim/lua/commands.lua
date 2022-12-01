local augroup = vim.api.nvim_create_augroup('commands', {clear = true})

local manualOpenedTerminal = "term://*\\(zsh\\|sh\\|bash\\|git*\\)"
vim.api.nvim_create_autocmd({"TermOpen"}, {
	pattern = {manualOpenedTerminal},
	desc = "Open terminal in insert mode",
	group = augroup,
	command = "startinsert",
})
vim.api.nvim_create_autocmd({"TermClose"}, {
	pattern = {manualOpenedTerminal},
	desc = "Auto close terminal",
	group = augroup,
	command = "call nvim_input('<CR>')",
})

vim.api.nvim_create_autocmd({"TermClose"}, {
	pattern = {"*"},
	desc = "Changes made in the files inside the :terminal are not reflected on the opened buffers",
	group = augroup,
	command = "checktime",
})

vim.api.nvim_create_autocmd({"TextYankPost"}, {
	pattern = {"*"},
	desc = "Hightlight yank",
	group = augroup,
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_user_command(
	"A",
	"Other",
	{desc = "Alternate between tests and implementation"}
)
vim.api.nvim_create_user_command(
	"AV",
	"OtherVSplit",
	{desc = "Alternate between tests and implementation (splitted)"}
)
vim.api.nvim_create_user_command(
	"AS",
	"OtherSplit",
	{desc = "Alternate between tests and implementation (splitted)"}
)

vim.api.nvim_create_user_command(
	"Explore",
	"Oil <args>",
	{nargs = "?", complete = "dir"}
)
vim.api.nvim_create_user_command(
	"Sexplore",
	"belowright split | Oil <args>",
	{nargs = "?", complete = "dir"}
)
vim.api.nvim_create_user_command(
	"Vexplore",
	"leftabove vsplit | Oil <args>",
	{nargs = "?", complete = "dir"}
)
-- avoid ambiguous commands set by other plugins (like :EyelinerToggle, :Eslint lsp server)...
vim.api.nvim_create_user_command(
	"E",
	"Explore <args>",
	{nargs = "?", complete = "dir"}
)

vim.api.nvim_create_user_command(
	"Gpatch",
	"tabe term://git add -p <args>",
	{nargs = "*", complete = "file"}
)

vim.api.nvim_create_user_command(
	"Rm",
	'exe "silent! !rm -r" <q-args> | bw! <q-args>',
	{nargs = 1, complete = "file"}
)
vim.api.nvim_create_user_command(
	"Mv",
	'exe "silent! !mv " . expand(\'%\') . " " . <q-args> | bw! | exe "e" <q-args>',
	{nargs = 1, complete = "file"}
)

vim.api.nvim_create_user_command(
	"MarkdownPasteImage",
	'call mdip#MarkdownClipboardImage()',
	{}
)

vim.api.nvim_create_user_command(
	"W",
	'!mkdir -p %:p:h | w',
	{desc = "Create directory and save file"}
)

vim.api.nvim_create_user_command(
	"New",
	"enew | FzfLua filetypes",
	{desc = "New file"}
)
