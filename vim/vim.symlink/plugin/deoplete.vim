if has('nvim')
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#sources#ternjs#filetypes = [
        \ 'javascript.jsx'
        \ ]
endif
