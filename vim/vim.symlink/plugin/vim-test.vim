if has('nvim')
  let test#strategy = 'neovim'
else
  let test#strategy = 'vimterminal'
endif

nmap <silent> <leader>n :TestNearest<CR>
nmap <silent> <leader>f :TestFile<CR>
nmap <silent> <leader>s :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>t :TestVisit<CR>
