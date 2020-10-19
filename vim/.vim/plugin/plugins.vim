call plug#begin()

" Addons
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch', { 'commit': '3757ddad87073a6ded8c34dfabb28c325acf6c02' }
Plug 'mbbill/undotree', { 'on': ['UndotreeToggle'] }
Plug 'cohama/lexima.vim' " Insert or delete brackets, parens, quotes in pair.
Plug 'lourenci/vim-visual-star-search'

Plug 'AndrewRadev/linediff.vim', { 'on': ['Linediff', 'LinediffReset'] }
Plug 'whiteinge/diffconflicts', { 'on': ['DiffConflicts', 'DiffConflictsWithHistory'] }

Plug 'tpope/vim-projectionist'
Plug 'airblade/vim-rooter'

Plug 'mateusbraga/vim-spell-pt-br'

" File system navigation
Plug '/usr/local/opt/fzf' " You need to install fzf yourself: `brew install fzf`
Plug 'junegunn/fzf.vim'
Plug 'wellle/context.vim', { 'on': ['ContextToggle', 'ContextPeek'] }

if has('nvim-0.5')
  Plug 'neovim/nvim-lsp'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'nvim-lua/completion-nvim'
else
  Plug 'sheerun/vim-polyglot'
endif

" Themes
Plug 'reedes/vim-colors-pencil'
Plug 'bluz71/vim-nightfly-guicolors'

Plug 'AaronLasseigne/yank-code', { 'on': ['YankCode'] }
Plug 'shuber/vim-promiscuous', { 'on': ['Promiscuous'] }

packadd Cfilter

call plug#end()
