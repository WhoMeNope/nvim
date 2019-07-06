" integrate with arline
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Basic settings {{{ "

" if hidden not set, TextEdit might fail.
set hidden

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" always show signcolumn
set signcolumn=yes

" }}} Basic settings "

" Key mappings - completion {{{ "

" use <tab> for trigger completion and navigate next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <C-x><C-o> to complete 'word', 'emoji' and 'include' sources
imap <silent> <C-x><C-o> <Plug>(coc-complete-custom)

" close completion window on done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" }}} Key mappings - completion "

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-=>"
let g:UltiSnipsJumpForwardTrigger="<c-0>"
let g:UltiSnipsJumpBackwardTrigger="<c-9>"

" Key mappings - navigation {{{ "

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show signature help while editing
autocmd CursorHoldI * silent! call CocActionAsync('showSignatureHelp')
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for format selected region
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" }}} Key mappings - navigation "

  " " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  " vmap <leader>a  <Plug>(coc-codeaction-selected)
  " nmap <leader>a  <Plug>(coc-codeaction-selected)

  " " Remap for do codeAction of current line
  " nmap <leader>ac  <Plug>(coc-codeaction)

" Commands {{{ "

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" }}} Commands "

" Denite shortcuts {{{ "

" Show symbols of current buffer
nnoremap <silent> <leader>co  :<C-u>Denite coc-symbols<cr>
" Search symbols of current workspace
nnoremap <silent> <leader>cw  :<C-u>Denite coc-workspace<cr>
" Show diagnostics of current workspace
nnoremap <silent> <leader>cd  :<C-u>Denite coc-diagnostic<cr>
" Show available commands
nnoremap <silent> <leader>cc  :<C-u>Denite coc-command<cr>
" Show available services
nnoremap <silent> <leader>cs  :<C-u>Denite coc-service<cr>
" Show links of current buffer
nnoremap <silent> <leader>cl  :<C-u>Denite coc-link<cr>

" }}} Denite shortcuts "

" enable symbol highlighting
autocmd CursorHold * silent call CocActionAsync('highlight')

