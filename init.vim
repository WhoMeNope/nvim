" When started as "evim", evim, vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

" Leaders
let mapleader = "\<space>"
let maplocalleader = "\<space>"

" Include fzf from homebrew
set rtp+=/usr/local/opt/fzf
nnoremap <leader>o :<C-U>FZF .<CR>

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

" Open, close, switch window
nnoremap <leader>t :vs<CR>:terminal<CR>i
tnoremap <C-q> <C-\><C-n>:q<CR>
tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>

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
" don't open lines with comments
set formatoptions-=o
" don't jump to begginning of line on page jumps
set nostartofline

" }}}

" Look & Feel ---------------------- {{{
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" set termguicolors

set background=dark
let g:solarized_visibility = 'high'
let g:solarized_extra_hi_groups = 1
colorscheme solarized8_high

set noshowmode " Hide mode indicator - included in airline

let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#whitespace#enabled = 0
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_section_z = '%3p%% %3l/%L:%3v'
" }}}

" Enable syntax highlight completion
set omnifunc=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabNoCompleteAfter = ['^', '^(\s|\t)+', '\s', '\t']

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
    autocmd FileType gitcommit set tw=72 spell wrap
augroup END

" markdown
augroup filetype_markdown
    autocmd!
    autocmd FileType markdown set spell
augroup END

" HTML, CSS
let g:user_emmet_install_global = 0
augroup filetype_html_css
    autocmd!
    autocmd FileType html,css EmmetInstall
augroup END

" SQL
let g:omni_sql_no_default_maps = 1

" Java
augroup filetype_java
    autocmd!
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
augroup END

" Javascript
let g:javascript_plugin_jsdoc = 1

" Elm
augroup filetype_elm
    autocmd!
    autocmd FileType elm setlocal tabstop=4 shiftwidth=4
augroup END

" Clojure
augroup filetype_clojure
    autocmd!
    autocmd VimEnter *.clj RainbowParenthesesToggle
    autocmd Syntax clojure RainbowParenthesesLoadRound
    autocmd Syntax clojure RainbowParenthesesLoadSquare
    autocmd Syntax clojure RainbowParenthesesLoadBraces
augroup END

" Haskell
let g:hindent_on_save = 0
let g:hindent_indent_size = 2
let g:hindent_line_length = 120

let g:haskell_indent_let = 4
let g:haskell_indent_in = 1
let g:haskell_indent_where = 6

let g:haskell_enable_quantification = 1   " enable highlighting of `forall`
" let g:haskell_enable_recursivedo = 1      " enable highlighting of `mdo` and `rec`
" let g:haskell_enable_arrowsyntax = 1      " enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " enable highlighting of type roles
" let g:haskell_enable_static_pointers = 1  " enable highlighting of `static`
" let g:haskell_backpack = 1                " enable highlighting of backpack keywords

augroup filetype_haskell
    autocmd!
    autocmd VimEnter *.hs :nnoremap <leader>i :<C-U>Hindent<CR>
augroup END

" }}}

" Linting ---------------------- {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['jshint', 'eslint', 'flow']
let g:syntastic_elm_checkers = ['elm_make']
let g:syntastic_go_checkers = ['go']
" }}}

iabbrev lenght length

" Key mappings ---------------------- {{{

" write all
nnoremap <leader>w :<C-U>wa<CR>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace
nnoremap <Leader>r :%s//g<Left><Left>

" Open configs
nnoremap <leader>ev :tabedit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Oh Goodies
command! WQ wq
command! WQA wqa
command! Wqa wqa
command! W w
command! Wa wa
command! WA wa
command! Q q

inoremap <C-E> <C-O><C-E>

" Formatting
nnoremap - :m-2<CR>==
nnoremap _ :m+1<CR>==
nnoremap <CR> $a<CR><esc>

" Extras
fun! ReadMan()
    let s:man_word = expand('<cword>')
    :exe ":wincmd n"
    :exe ":r!man " . s:man_word . " | col -b"
    :exe ":goto"
endfun
" K to read the manual for underlying word
nnoremap K :call ReadMan()<CR>

" Clear all registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
" }}}
