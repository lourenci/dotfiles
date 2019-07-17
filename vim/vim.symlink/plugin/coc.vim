" Close preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Commands for the git extension
nmap ]g <Plug>(coc-git-nextchunk)
nmap [g <Plug>(coc-git-prevchunk)
nmap gs <Plug>(coc-git-chunkinfo)
nmap gu :CocCommand git.chunkUndo<CR>
nnoremap <silent> gh  :<C-u>CocList --normal bcommits<CR>

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not found' messages
set shortmess+=c
