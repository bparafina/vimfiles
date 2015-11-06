set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'elzr/vim-json'
Plugin 'chrisbra/vim-diff-enhanced'
Plugin 'katono/rogue.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'majutsushi/tagbar'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Raimondi/deliMITMate'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-git'
Plugin 'vim-scripts/ShowTrailingWhitespace'
Plugin 'vim-scripts/DeleteTrailingWhitespace'
Plugin 'tpope/vim-unimpaired'
Plugin 'bling/vim-airline'
Plugin 'xenoterracide/html.vim'
Plugin 'klen/python-mode'
Bundle 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'saltstack/salt-vim'
Bundle 'jistr/vim-nerdtree-tabs'
Plugin 'tomasr/molokai'
Bundle 'wakatime/vim-wakatime'
Plugin 'shuber/vim-promiscuous'
Bundle 'lepture/vim-jinja'
Plugin 'flazz/vim-colorschemes'
call vundle#end()
colorscheme molokai

filetype plugin on
filetype plugin indent on
syntax on
set statusline+=%#warningmsg#
set background=light
set nocp
set tags=tags
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:netrw_altv = 1
let g:netrw_fastbrowse = 2
let g:netrw_keepdir = 0
let g:netrwliststyle = 2
let g:netrw_retmap = 1
let g:netrw_silent = 1
let g:netrw_special_syntax = 1
set foldmethod=indent
set foldlevel=99
set hidden
set backspace=indent,eol,start
let g:pyflakes_use_quickfix = 0
set foldcolumn=0

set autoindent
set backup
set nu
set smartindent
set showmatch
set title
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set modeline
set ls=2

map <C-g> :GundoToggle<CR>

set nocompatible

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

map <C-j> :RopeGotoDefinition<CR>
map <C-r> :RopeRename<CR>
nmap <C-a> <Esc>:Ack!
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

set laststatus=2

:
let g:Powerline_symbols = 'fancy'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

autocmd StdinReadPre * let s:std_in=1
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : " ✹ ",
    \ "Staged"    : " ✚ ",
    \ "Untracked" : " ✭ ",
    \ "Renamed"   : " ➜ ",
    \ "Unmerged"  : " ═ ",
    \ "Deleted"   : " ✖ ",
    \ "Dirty"     : " ✗ ",
    \ "Clean"     : " ✔︎ ",
    \ "Unknown"   : " ? "}

set runtimepath^=~/.vim/bundle/ctrlp.vim

set noswapfile
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

let g:promiscuous_dr = $HOME . '/.vim/Promiscuous'
let g:promiscuous_prefix = '[Promiscuous]'
let g:promiscuous_verbose = 0

set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize
set undolevels=1000
set undoreload=10000

nmap <leader>gb :Promiscuous<cr>
nmap <leader>gg :Promiscuous -<cr>
set wildmenu
set lazyredraw
set cursorline
set showmatch
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<cr>

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

let g:airline#extensions#tabline#enabled = 1
