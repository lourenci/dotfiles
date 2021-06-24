call plug#begin()

" Addons
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'mbbill/undotree', { 'on': ['UndotreeToggle'] }
Plug 'cohama/lexima.vim' " Insert or delete brackets, parens, quotes in pair.
Plug 'lourenci/vim-visual-star-search'

Plug 'whiteinge/diffconflicts', { 'on': ['DiffConflicts', 'DiffConflictsWithHistory'] }

Plug 'tpope/vim-projectionist'
Plug 'airblade/vim-rooter'

Plug 'mateusbraga/vim-spell-pt-br'

" File system navigation
Plug '/usr/local/opt/fzf' " You need to install fzf yourself: `brew install fzf`
Plug 'junegunn/fzf.vim'


if has('nvim-0.5')
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
  Plug 'romgrk/nvim-treesitter-context'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'ray-x/lsp_signature.nvim'
else
  Plug 'sheerun/vim-polyglot'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
endif

" Themes
Plug 'lourenci/github-colors'


packadd Cfilter

call plug#end()
