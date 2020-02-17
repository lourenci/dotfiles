call plug#begin()

" Addons
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'vim'] }
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair.
Plug 'alvan/vim-closetag', { 'for': ['html', 'javascriptreact', 'javascript'] }
Plug 'PeterRincker/vim-argumentative'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'nelstrom/vim-visual-star-search'
Plug 'moll/vim-bbye', { 'on': ['Bd', 'Bw'] }
Plug 'junegunn/vim-peekaboo'

Plug 'tpope/vim-projectionist'
Plug 'airblade/vim-rooter'

Plug 'mateusbraga/vim-spell-pt-br'

" File system navigation
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'wellle/context.vim', { 'on': ['ContextToggle'] }
Plug 'jeetsukumaran/vim-indentwise'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}

if !has('nvim')
  Plug 'markonm/traces.vim'
endif

" Themes
if !has('gui_running')
  Plug 'arakashic/nvim-colors-solarized'
else
  Plug 'altercation/vim-colors-solarized'
endif
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'rakr/vim-one'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'haishanh/night-owl.vim'
Plug 'cormacrelf/vim-colors-github'
Plug 'sainnhe/gruvbox-material'
Plug 'reedes/vim-colors-pencil'
Plug 'wadackel/vim-dogrun'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'arzg/vim-colors-xcode'
Plug 'relastle/bluewery.vim'
Plug 'junegunn/seoul256.vim'

Plug 'AaronLasseigne/yank-code', { 'on': ['YankCode'] }

Plug 'junegunn/rainbow_parentheses.vim', { 'for': ['clojure', 'lisp'] }

call plug#end()
