call plug#begin()

" Addons
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'matze/vim-move'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise' " Close 'begin end' ruby tag wisely
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'andymass/vim-matchup' " Expand % match to a lot of languages and hightlight it
Plug 'tpope/vim-commentary'
Plug 'farmergreg/vim-lastplace' " When reopen a buffer, puts the cursor where it was last time
Plug 'michaeljsmith/vim-indent-object'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-rhubarb'
Plug 'janko-m/vim-test'
Plug 'chrisbra/Colorizer' " Display hex colors
Plug 'ludovicchabant/vim-gutentags' " Generate ctags automatically
Plug 'mbbill/undotree'
Plug 'junegunn/vim-peekaboo'
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair.
Plug 'alvan/vim-closetag' " Autoclose HTML tags
Plug 'semanser/vim-outdated-plugins'

" File system navigation
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rails'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'ervandew/supertab'
else
  " YouCompleteMe works only macvim
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer' }
endif

" Syntax errors
Plug 'w0rp/ale'

" Themes
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'arcticicestudio/nord-vim'
Plug 'whatyouhide/vim-gotham'
Plug 'hzchirs/vim-material'
Plug 'rakr/vim-one'
Plug 'dracula/vim'
Plug 'haishanh/night-owl.vim'

call plug#end()
