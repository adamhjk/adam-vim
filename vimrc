set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'FuzzyFinder'
Bundle 'taglist.vim'
Bundle 'Gist.vim'
Bundle 'L9'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'VimClojure'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'
Bundle 'duskhacker/sweet-rspec-vim'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'confluencewiki.vim'
Bundle 'majutsushi/tagbar'
Bundle 'vim-orgmode'
Bundle 'vim-ruby/vim-ruby'
Bundle 'matchit.zip'
Bundle 'CSApprox'

filetype plugin indent on     " required! 
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

filetype plugin indent on

set hidden
set number
set wildmenu
set wildmode=list:longest
set title

set softtabstop=2
set shiftwidth=2
set tabstop=2
set autoindent
" Use spaces instead of tabs
set expandtab
colorscheme twilight 
if has("gui_gtk2")
  set guifont=Inconsolata\ 12
else
  set guifont=Inconsolata:h16
endif
set ignorecase
set vb " turns off visual bell
set smartindent
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=\ %{fugitive#statusline()}     " fugitive
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position

compiler ruby


let g:fuzzy_ignore = "*.log" 
let g:fuzzy_matching_limit = 70
let mapleader=","
let maplocalleader=","

let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Process_File_Always=1
let Tlist_Show_Menu=1
let Tlist_Enable_Fold_Column=0
let g:gist_detect_filetype = 1
let g:tagbar_autofocus = 1

let g:vimclojure#ParenRainbow = 1
let g:vimclojure#HighlightBuiltins = 1 
let g:vimclojure#WantNailgun = 1
let python_highlight_all = 1

map <right> :bn<cr>
map <left> :bp<cr>
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

set grepprg=ack
set grepformat=%f:%l:%m

map <leader>t :CommandT<CR>
map <leader>b :FufBuffer<CR>
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>j :TagbarToggle<CR>

" Command T

let g:CommandTMaxFiles=30000
let g:CommandTMaxDepth=30
let g:CommandTMaxHeight=20

" Hold command to do the g for softwrap
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

" CSApprox
if (&term == 'xterm')
  set t_Co=256
endif
" Make CommandT work with rxvt
if (&term == 'rxvt-unicode' || &xterm == 'rxvt')
  let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
endif

" Suppress lustyjuggler warnings
let g:LustyJugglerSuppressRubyWarning = 1

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set backupdir=~/.vimbackup//,/tmp//
set directory=~/.vimswaps//,/tmp//

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

if has("gui_running")
  set guioptions=egmrt
endif

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

autocmd BufRead *\.txt setlocal formatoptions=l
autocmd BufRead *\.txt setlocal lbr
autocmd BufRead *\.txt map j gj
autocmd BufRead *\.txt map k gk
autocmd BufRead *\.txt setlocal smartindent
autocmd BufRead *\.txt setlocal spell spelllang=en_us

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  autocmd FileType make     set noexpandtab
  autocmd FileType python   set noexpandtab
  

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END


  if exists("did\_load\_filetypes")

    finish

  endif

  augroup markdown

    au! BufRead,BufNewFile *.mkd   setfiletype mkd

  augroup END

  augroup mkd

    autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>

  augroup END

else

  set autoindent		" always set autoindenting on

  " Settings for raw text editing
endif " has("autocmd")


