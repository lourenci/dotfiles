" Close preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Commands for the git extension
nmap ]z <Plug>(coc-git-nextchunk)
nmap [z <Plug>(coc-git-prevchunk)
nmap zs <Plug>(coc-git-chunkinfo)
nmap zu :CocCommand git.chunkUndo<CR>
nnoremap <silent> zh  :<C-u>CocList --normal bcommits<CR>

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not found' messages
set shortmess+=c

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
