vim.loader.enable()

require("keymappings").setup()
require("commands")

vim.opt.showbreak = "↪"
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.updatetime = 750
vim.opt.autowriteall = true
vim.opt.scrollback = 100000
vim.opt.exrc = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.showmode = false

vim.opt.diffopt:append({ "algorithm:patience", "linematch:5000", "iwhite" })

vim.opt.undofile = true

vim.wo.foldtext = 'v:lua.vim.treesitter.foldtext()'
vim.opt.foldmethod = "expr"
vim.opt.foldenable = false
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false

vim.opt.timeout = false
vim.opt.ttimeout = false

vim.opt.shortmess:append({ c = true, W = true, C = true })

vim.opt.completeopt:remove({ "preview" })

vim.opt.conceallevel = 2

vim.g.loaded_remote_plugins = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zipPlugin = 1

vim.opt.termguicolors = true
vim.opt.background = "light"

vim.o.winbar = "[%{winnr()}]"

vim.cmd.aunmenu { "PopUp.How-to\\ disable\\ mouse" }
vim.cmd([[
	nmenu PopUp.Close <C-w>q
	nmenu PopUp.\  <Nop>
	nmenu PopUp.Toggle\ fold za
	nmenu PopUp.\  <Nop>
	nmenu PopUp.Go\ to\ definition <C-]>
	vmenu PopUp.Go\ to\ definition <C-]>
	nmenu PopUp.Find\ all\ usages <leader>gr
	vmenu PopUp.Find\ all\ usages <leader>gr
	nmenu PopUp.Find\ all\ implementations <leader>gi
	vmenu PopUp.Find\ all\ implementations <leader>gi
]])

require("config/lazy")
