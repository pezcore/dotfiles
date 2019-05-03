" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'vim-syntastic/syntastic'
Plug 'gcmt/taboo.vim'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'inkarkat/vim-SpellCheck'
Plug 'inkarkat/vim-ingo-library'
Plug 'rhysd/vim-clang-format'
Plug 'junegunn/fzf.vim'

" color themes
Plug 'baskerville/bubblegum'
Plug 'chriskempson/base16-vim'
Plug 'nightsense/vimspectr'
Plug 'aradunovic/perun.vim'
Plug 'nightsense/stellarized'
Plug 'dim13/smyck.vim'
Plug 'kadekillary/skull-vim'
Plug 'ajmwagar/vim-deus'
Plug 'nanotech/jellybeans.vim'
Plug 'preocanin/greenwint'
Plug 'rhysd/vim-color-spring-night'
Plug 'fneu/breezy'
Plug 'davidklsn/vim-sialoquent'
Plug 'robertmeta/nofrils'
Plug 'dylanaraps/crayon'
Plug 'juanpabloaj/vim-pixelmuerto'
Plug 'kamwitsta/nordisk'
Plug 'mbbill/vim-seattle'
Plug 'rakr/vim-one'
Plug 'arcticicestudio/nord-vim'
Plug 'romainl/Apprentice'
Plug 'jacoborus/tender.vim'
Plug 'joshdick/onedark.vim'
Plug 'dikiaap/minimalist'
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
Plug 'jdkanani/vim-material-theme'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

filetype plugin on
syntax on
set nu rnu tgc lbr ar cc=80 et sw=4
" colo base16-tomorrow-night
set t_Co=256
set guioptions=  "remove menu bar
set popt=paper:letter

" Keybindings for tagbar
nmap <F8> :TagbarToggle<CR>
nmap <F9> :e .<CR>
autocmd VimEnter * nested :TagbarOpen
let g:tagbar_width = 25

" cursor mode blinking and stuff
set gcr+=n-v-c:blinkon80-blinkoff80-blinkwait700
set gcr+=i:ver20-blinkon80-blinkoff80-blinkwait700

" Easy motion search bindings
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" Recommended Syntastic settings from https://github.com/scrooloose/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_matlab_checkers = ['mlint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


let g:airline_powerline_fonts = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#default#section_truncate_width = {
  \ 'b': 79,
  \ 'x': 60,
  \ 'y': 88,
  \ 'z': 105,
  \ 'warning': 140,
  \ 'error': 140,
  \ }

" fast buffer switching
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l

" quick saving
nmap <C-S> :update<CR>
" open a terminal in a new tab
nmap <C-T> :tabed term://zsh<CR>a
nmap <C-W><C-T> :sp term://zsh<CR>a

" fzf bindings
nmap <C-\><C-E> :Files<CR>

let g:NERDTreeWinSize = 26
map <C-n> :NERDTreeToggle<CR>
