set term=ansi
set rtp=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
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
Plugin 'xenoterracide/html.vim'
Plugin 'klen/python-mode'
Bundle 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'saltstack/salt-vim'
Bundle 'jistr/vim-nerdtree-tabs'
Plugin 'lokaltog/vim-powerline'
Plugin 'tomasr/molokai'
Plugin 'hdima/python-syntax'
Bundle 'wakatime/vim-wakatime'

Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

set statusline+=%#warningmsg#
syntax on
let g:solarized_termcolors=256
set t_Co=256 
set background=dark

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:netrw_altv = 1
let g:netrw_fastbrowse = 2
let g:netrw_keepdir = 0
let g:netrwliststyle = 2
let g:netrw_retmap = 1
let g:netrw_silent = 1
let g:netrw_special_syntax = 1
set foldmethod=indent
set foldlevel=99
filetype plugin indent on
set hidden
set backspace=indent,eol,start
let g:pyflakes_use_quickfix = 0


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

filetype plugin on
set modeline
set ls=2

map <leader>g :GundoToggle<CR>

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
nmap <leader>a <Esc>:Ack!
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

set laststatus=2

let g:Powerline_symbols = 'fancy'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
set nocompatible
filetype plugin indent on

autocmd StdinReadPre * let s:std_in=1
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"}

set runtimepath^=~/.vim/bundle/ctrlp.vim

let python_highlight_all=1
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set noswapfile
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
