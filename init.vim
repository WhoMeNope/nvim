" When started as "evim", evim, vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

" Leaders
let mapleader = "\<space>"
let maplocalleader = "\<space>"

" don't open lines with comments
" don't insert comment leader in insert mode
" remove comment leader on join
set formatoptions=jcql

" Netrw ---------------------- {{{
let g:netrw_preview   = 1
let g:netrw_liststyle = 3
let g:netrw_winsize   = 20
let g:netrw_banner    = 0
let g:netrw_altv      = 1
let g:netrw_list_hide = netrw_gitignore#Hide() . '.*\.swp$,.*\.un\~$,.git/$'

nnoremap <leader>l :Lexplore<CR>

" }}}

" Terminal ---------------------- {{{

" No linenumbers in terminal
au TermOpen * setlocal nonumber norelativenumber

" Autoinsert mode
autocmd BufEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" Open, close, switch window, open in tab, switch tab
nnoremap <leader>tv :vs<CR>:terminal<CR>i
nnoremap <leader>ts :sp<CR>:terminal<CR>i
nnoremap <leader>tt :tabedit<CR>:terminal<CR>i
tnoremap <C-q> <C-\><C-n>:q<CR>
tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>
tnoremap gt <C-\><C-n>gt

" }}}

" Vim basic settings ---------------------- {{{

" Setup undofiles
set nobackup undofile

" Set numbers, scrolloffset
set ruler number relativenumber
set scrolloff=3

" indentation
set autoindent smartindent
set tabstop=2 shiftwidth=2
set softtabstop=-1 shiftround expandtab

" cursor line
set cursorline

" window behaviour
set splitright splitbelow

" show matching paren on closing for n 10ths of second
set showmatch matchtime=1

" highlight search, incremental search
if &t_Co > 2 || has("gui_running")
    set hlsearch incsearch
endif

" enable syntax files
syntax on

" don't jump to begginning of line on page jumps
set nostartofline

" }}}

" Look & Feel ---------------------- {{{
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

let g:solarized_visibility = 'high'
let g:solarized_extra_hi_groups = 1
colorscheme solarized8_high
set background=dark

set noshowmode " Hide mode indicator - included in airline

let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#whitespace#enabled = 0
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_section_c = '%{ObsessionStatus()} %f'
let g:airline_section_z = '%3p%% %3l/%L:%3v'
" }}}

" Enable syntax highlight completion
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabNoCompleteAfter = ['^', '^(\s|\t)+', '\s', '\t']

" Key mappings ---------------------- {{{

" write all
nnoremap <silent> <leader>w :<C-U>wa<CR>
" write all and quit
nnoremap <silent> <leader>qq :<C-U>wqa<CR>
" close current
fun! CloseCurrent()
    if &readonly || @% == ""
        execute ':q'
    else
        execute ':wq'
    endif
endfun
nnoremap <silent> <C-c> :<C-u>call CloseCurrent()<CR>
nnoremap <silent> <leader>c :<C-u>call CloseCurrent()<CR>

" Edit new file
nnoremap <leader>nn :<C-U>e<SPACE>
nnoremap <leader>ns <C-w><C-s>:<C-U>e<SPACE>
nnoremap <leader>nv <C-w><C-v>:<C-U>e<SPACE>
nnoremap <leader>nt :<C-U>tabedit<SPACE>

" horizontal <-> vertical splits
nnoremap <leader>swh <C-w>t<C-w>K
nnoremap <leader>swv <C-w>t<C-w>H

" next split
nnoremap <CR> <C-w><C-w>

" switch buffer
nnoremap <silent> <C-n> :w<CR>:bnext<CR>
nnoremap <silent> <C-p> :w<CR>:bprevious<CR>
nnoremap <silent> <C-x> :w<CR>:bdelete<CR>

" Use <C-L> to clear the highlighting of :set hlsearch.
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

" Search and Replace
nnoremap <Leader>sr :%s//g<Left><Left>

" Open configs
nnoremap <silent> <leader>ev :tabedit $MYVIMRC<CR>
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>

" Oh Goodies
command! WQ wq
command! WQA wqa
command! Wqa wqa
command! W w
command! Wa wa
command! WA wa
command! Q q
command! Qa qa
command! QA qa

nnoremap Q @q

inoremap <C-E> <C-O><C-E>

" Reindent the whole file
nnoremap <leader>ri migg=G`i

" K to read the manual for underlying word
fun! ReadMan()
    let s:man_word = expand('<cword>')
    :exe ":wincmd n"
    :exe ":r!man " . s:man_word . " | col -b"
    :exe ":goto"
endfun
nnoremap K :call ReadMan()<CR>

" Clear all registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" }}}

" Filetype specific---------------------- {{{
filetype plugin on
filetype plugin indent on

" vim
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal tabstop=4 shiftwidth=4
augroup END

" gitcommit
augroup filetype_gitcommit
    autocmd!
    autocmd FileType gitcommit setlocal tw=72 spell wrap
augroup END

" markdown
augroup filetype_markdown
    autocmd!
    autocmd FileType markdown setlocal tw=72 spell wrap
    autocmd FileType markdown packadd markdown-preview.vim
augroup END

" SQL
let g:omni_sql_no_default_maps = 1

" Assembly
augroup filetype_asm
    autocmd!
    autocmd FileType asm setlocal tabstop=4 shiftwidth=4 noexpandtab
    autocmd FileType asm setlocal commentstring=#\ %s
augroup END

" Clojure
augroup filetype_clojure
    autocmd!
    autocmd VimEnter *.clj RainbowParenthesesToggle
    autocmd Syntax clojure RainbowParenthesesLoadRound
    autocmd Syntax clojure RainbowParenthesesLoadSquare
    autocmd Syntax clojure RainbowParenthesesLoadBraces
augroup END

" }}}

" disable moving parentheses - detects '<' as a start of sequence in insert mode
let g:AutoPairsMoveCharacter=""

" abbreviations
iabbrev lenght length

" source local config, if exists
" leave at the end so defaults can be overridden
let local_config = $HOME . "/.config/nvim/local.vim"
if filereadable(local_config)
    execute "source " . local_config
endif
