set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'FuzzyFinder'
Plugin 'taglist.vim'
Plugin 'Gist.vim'
Plugin 'L9'
Plugin 'kien/ctrlp.vim'
Plugin 'VimClojure'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'duskhacker/sweet-rspec-vim'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'confluencewiki.vim'
Plugin 'majutsushi/tagbar'
Plugin 'vim-orgmode'
Plugin 'vim-ruby/vim-ruby'
Plugin 'matchit.zip'
Plugin 'CSApprox'
Plugin 'timcharper/textile.vim'
Plugin 'jimenezrick/vimerl'
Plugin 'skwp/vim-conque'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'JSON.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'wting/rust.vim'
Plugin 'fatih/vim-go'

call vundle#end()
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
set background=dark
"colorscheme base16-default
colorscheme twilight
" colorscheme solarized
if has("gui_gtk2")
  set guifont=Inconsolata\ for\ Powerline\ 12
else
  set guifont=Inconsolata\ for\ Powerline:h16
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
let g:airline_powerline_fonts = 1
" let g:Powerline_symbols = 'fancy'
" set rtp+=/Users/adam/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim

set listchars=tab:>\ ,trail:•,extends:>,precedes:<,nbsp:+
set list

map <right> :bn<cr>
map <left> :bp<cr>
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

set grepprg=ack
set grepformat=%f:%l:%m

map <leader>t :CtrlP<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>j :TagbarToggle<CR>

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

" ctrlp
let g:ctrlp_working_path_mode = 2
let g:ctrlp_switch_buffer = 0
let g:ctrlp_max_files = 20000


" CSApprox
if (&term == 'xterm')
  set t_Co=256
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

au! BufRead,BufNewFile *.confluencewiki set ft=confluencewiki
autocmd BufRead *\.txt setlocal formatoptions=l
autocmd BufRead *\.txt setlocal lbr
autocmd BufRead *\.txt map j gj
autocmd BufRead *\.txt map k gk
autocmd BufRead *\.txt setlocal smartindent
autocmd BufRead *\.txt setlocal spell spelllang=en_us

au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
augroup END

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

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

  " erlang for opscode
  autocmd FileType erlang set expandtab
  autocmd FileType erlang set softtabstop=4 tabstop=4 shiftwidth=4
  autocmd FileType erlang set textwidth=92

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

  au! BufRead,BufNewFile *.mkd   setfiletype mkd

  augroup mkd

    autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>

  augroup END

  if exists("did\_load\_filetypes")

    finish

  endif

else

  set autoindent		" always set autoindenting on

  " Settings for raw text editing
endif " has("autocmd")


