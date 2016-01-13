
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'xenoterracide/html.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'SirVer/ultisnips.git'
Plugin 'chrisbra/vim-diff-enhanced'
Plugin 'tpope/vim-surround'
Plugin 'katono/rogue.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'airblade/vim-rooter'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'godlygeek/tabular'
Plugin 'Yggdroot/indentLine'
Plugin 'plasticboy/vim-markdown'
Plugin 'majutsushi/tagbar'
Plugin 'rking/ag.vim'
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
Plugin 'terryma/vim-multiple-cursors'
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
Plugin 'derekwyatt/vim-sbt'
Plugin 'szw/vim-tags'
Plugin 'fboender/bexec'
Plugin 'blindFS/vim-taskwarrior'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-scripts/mru.vim'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/nginx.vim'
call vundle#end()
colorscheme molokai

filetype plugin on
filetype plugin indent on
syntax on
set statusline+=%#warningmsg#
set background=dark
set nocp
set tags=tags
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 1

let g:netrw_altv = 1
let g:netrw_fastbrowse = 2
let g:netrw_keepdir = 0
let g:netrwliststyle = 2
let g:netrw_retmap = 1
let g:netrw_silent = 1
let g:netrw_special_syntax = 1
set foldmethod=indent
set foldlevel=0
set hidden
set backspace=indent,eol,start
let g:pyflakes_use_quickfix = 0


function! OutlineToggle()
  if (! exists ("b:outline_mode"))
    let b:outline_mode = 0
  endif
  if (b:outline_mode == 0)
    syn region myFold start="{" end="}" transparent fold
    syn sync fromstart
    set foldmethod=syntax
    silent! exec "%s/{{{/<<</"
    silent! exec "%s/}}}/>>>/"
    let b:outline_mode = 1
  else
    set foldmethod=marker
    silent! exec "%s/<<</{{{/"
    silent! exec "%s/>>>/}}}/"
    let b:outline_mode = 0
  endif
endfunction

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

let g:Powerline_symbols = 'fancy'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

autocmd StdinReadPre * let s:std_in=1
map <C-N> :NERDTreeToggle<CR>
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

let g:vim_tags_ignore_files = ['.gitignore', '.svnignore', '.cvsignore']
let g:vim_tags_auto_generate = 1
let g:vim_tags_project_tags_command = "{CTAGS} -R {OPTIONS} {DIRECTORY} 2>/dev/null"
let g:vim_tags_gems_tags_command = "{CTAGS} -R {OPTIONS} `bundle show --paths` 2>/dev/null"
let g:vim_tags_use_vim_dispatch = 0
let g:vim_tags_directories = [".git", ".hg", ".svn", ".bzr", "_darcs", "CVS"]
let g:vim_tags_main_file = 'tags'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <F9> :make<Return>:copen<Return>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>

noremap <F5> :call JavaInsertImport()<CR>
function! JavaInsertImport()
  exe "normal mz"
  let cur_class = expand("<cword>")
  try
    if search('^\s*import\s.*\.' . cur_class . '\s*;') > 0
      throw getline('.') . ": import already exist!"
    endif
    wincmd }
    wincmd P
    1
    if search('^\s*public.*\s\%(class\|interface\)\s\+' . cur_class) > 0
      1
      if search('^\s*package\s') > 0
        yank y
      else
        throw "Package definition not found!"
      endif
    else
      throw cur_class . ": class not found!"
    endif
    wincmd p
    normal! G
    " insert after last import or in first line
    if search('^\s*import\s', 'b') > 0
      put y
    else
      1
      put! y
    endif
    substitute/^\s*package/import/g
    substitute/\s\+/ /g
    exe "normal! 2ER." . cur_class . ";\<Esc>lD"
  catch /.*/
    echoerr v:exception
  finally
    " wipe preview window (from buffer list)
    silent! wincmd P
    if &previewwindow
      bwipeout
    endif
    exe "normal! `z"
  endtry
endfunction

let g:task_rc_override = 'rc.defaultwidth=0'
noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-y>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
