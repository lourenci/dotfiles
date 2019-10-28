" Settings in this file may depend on plugins, so let's install them first.
" Not to be confused with the contents of ~/.vim/plugin/* which are
" configuration options for each plugin and automatically loaded by Vim.
if has('nvim')
  source ~/.config/nvim/plugin/plugins.vim
  source ~/.config/nvim/keymappings.vim
else
  source ~/.vim/plugin/plugins.vim
  source ~/.vim/keymappings.vim
endif

syntax on

set hidden                            " Allows change the buffer without the needs to save it
set autoread                          " Auto reload changed files
set wildmenu                          " Tab autocomplete in command mode
set clipboard=unnamed,unnamedplus     " Clipboard support (OSX)
set laststatus=2                      " Show status line on startup
set nowrap                            " Don't wrap long lines
set listchars=extends:→               " Show arrow if line continues rightwards
set listchars+=precedes:←             " Show arrow if line continues leftwards
set nobackup nowritebackup noswapfile " Turn off backup files
set noerrorbells novisualbell         " Turn off visual and audible bells
set expandtab shiftwidth=2 tabstop=2  " Two spaces for tabs everywhere
set history=500                       " Number of commands history to store
set hlsearch                          " Highlight search results
set ignorecase smartcase              " Search queries intelligently set case
set incsearch                         " Show search results as you type
set splitright                        " Open new splits to the right
set splitbelow                        " Open new splits to the bottom
set noshowmode                        " Do not show the mode below the statusline
set exrc                              " enable project speficific vimrc
set showcmd                           " shows partial commands in the right bottom of screen
set encoding=utf-8
set synmaxcol=300                     " make syntax highligh works just for the first 300 chars
set diffopt+=indent-heuristic,algorithm:patience
set undodir=~/.vim/undo/
set undofile
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/vendor/bundle/*
set wildignore+=*/node_modules/*
set wildignore+=*/coverage/*
set number relativenumber " Enable line numbers
set foldmethod=indent
set nofoldenable
set cursorline " Highlight on current line
set colorcolumn=120 " Vertital column at 120
if !has('gui_running')
  set termguicolors
  set mouse=a
endif
if has('nvim')
  set inccommand=nosplit
endif

" Colorscheme
if strftime("%H") >= 17
  let g:nord_cursor_line_number_background = 1
  let g:nord_uniform_diff_background = 1
  let g:nord_italic = 1
  let g:nord_bold = 1
  let g:nord_italic_comments = 1
  let g:nord_underline = 1
  colorscheme nord
else
  set background=light
  let g:pencil_terminal_italics = 1
  colorscheme pencil
endif

" Change keyboard to USA layout on vim enter
if executable('xkbswitch')
  augroup SetEnglishKeyboard
    autocmd!
    autocmd VimEnter * silent !{xkbswitch -se US}
  augroup END
endif

if !has('gui_running')
  augroup LoadChangedFileExternally
    autocmd!
    autocmd FocusGained * :checktime
  augroup END
endif
