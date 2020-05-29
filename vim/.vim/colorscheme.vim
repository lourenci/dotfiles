syntax on
set termguicolors

function! Pencil() abort
  set background=light
  let g:pencil_terminal_italics = 1
  colorscheme pencil
endfunction

function! s:randnum(max) abort
  return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:]) % a:max
endfunction

function! One() abort
  let g:one_allow_italics = 1
  colorscheme one
endfunction

function! MiraMare() abort
  let g:miramare_enable_italic = 1
  colorscheme miramare
endfunction

if strftime("%H") >= 17
  set background=dark

  let randomColorscheme = s:randnum(6)
  if randomColorscheme == 1
    call MiraMare()
  elseif randomColorscheme == 2
    colorscheme dogrun
  elseif randomColorscheme == 3
    colorscheme nightfly
  elseif randomColorscheme == 4
    colorscheme gotham
  elseif randomColorscheme == 5
    let ayucolor="mirage"
    colorscheme ayu
  else
    call One()
  endif
else
  set background=light

  let randomColorscheme = s:randnum(4)
  if randomColorscheme == 1
    call Pencil()
  elseif randomColorscheme == 2
    call One()
  elseif randomColorscheme == 3
    let ayucolor="light"
    colorscheme ayu
  else
    colorscheme PaperColor
  endif
endif
