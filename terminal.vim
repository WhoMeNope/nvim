" No linenumbers in terminal
au TermOpen * setlocal nonumber norelativenumber

" Autoinsert mode
autocmd BufEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" Open, close, switch window, open in tab, switch tab
nnoremap <leader>tv :vs<CR>:terminal<CR>i
nnoremap <leader>ts :sp<CR>:terminal<CR>i
nnoremap <leader>tt :tabedit<CR>:terminal<CR>i
tnoremap <C-q> <C-\><C-n>:bdelete<CR>
tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>
tnoremap gt <C-\><C-n>gt
