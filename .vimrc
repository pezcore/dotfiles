filetype on
syntax on
autocmd vimenter * NERDTree
set nu!
set lbr!
set t_Co=256
set guioptions=  "remove menu bar
"set guifont=Monaco\ 9
"set guifont=Monaco\ 10
set guifont=Terminess\ Powerline\ 11
set popt=paper:letter
set autoread


" Powerline
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup

nmap <F8> :TagbarToggle<CR>
nmap <F9> :e .<CR>
call pathogen#infect()

set gcr+=n-v-c:blinkon80-blinkoff80-blinkwait700
set gcr+=i:ver20-blinkon80-blinkoff80-blinkwait700

" PEP 8 stuff
set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " an hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line

colo bubblegum-256-dark
let g:airline_powerline_fonts = 1
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 79,
    \ 'x': 60,
    \ 'y': 88,
    \ 'z': 90,
    \ 'warning': 110,
    \ 'error': 10,
    \ }
let g:airline#extensions#whitespace#trailing_format = 'tw[%s]'
let g:airline#extensions#branch#displayed_head_limit = 10

" Easy motion search bindings
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Integration of the mlint Matlab code checker with the :make command
" This is from the matlab vim bundle by Fabrice Guy
autocmd BufEnter *.m    compiler mlint

" Recommended Syntastic settings from https://github.com/scrooloose/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_matlab_checkers = ['mlint']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" fast buffer switching
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

" quick saving
nmap <C-S> :update<CR>
