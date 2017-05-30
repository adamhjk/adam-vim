set nocompatible
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'FuzzyFinder'
Plug 'taglist.vim'
Plug 'Gist.vim'
Plug 'L9'
Plug 'VimClojure'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'duskhacker/sweet-rspec-vim'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'confluencewiki.vim'
Plug 'majutsushi/tagbar'
Plug 'vim-orgmode'
Plug 'vim-ruby/vim-ruby'
Plug 'matchit.zip'
Plug 'CSApprox'
Plug 'timcharper/textile.vim'
Plug 'jimenezrick/vimerl'
Plug 'altercation/vim-colors-solarized'
"Plug 'w0rp/ale'
Plug 'JSON.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'bling/vim-airline'
Plug 'chriskempson/base16-vim'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
Plug 'Chiel92/vim-autoformat'
Plug 'racer-rust/vim-racer'
Plug 'leafgarland/typescript-vim'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'cespare/vim-toml'
Plug 'nanotech/jellybeans.vim'
Plug 'ajh17/Spacegray.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

let g:neomake_open_list=2

let g:is_bash=1
let g:ale_open_list = 1
let g:ale_rust_cargo_use_check = 1
let g:racer_cmd = "/home/adam/.cargo/bin/racer"
let $RUST_SRC_PATH="/home/adam/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust"
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1
let g:rustc_path = "/usr/local/bin/rustc"
let g:tagbar_autofocus = 1
let g:racer_experimental_completer = 1
set omnifunc=syntaxcomplete#Complete

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

let g:gruvbox_contrast_dark="hard"
let g:gruvbox_improved_strings=0
let g:gruvbox_italic=1

colorscheme gruvbox

nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
noremap <silent> coh :call gruvbox#hls_toggle()<CR>

nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

"colorscheme jellybeans

"colorscheme vwilight
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

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='zenburn'

" set statusline=
" set statusline+=%-3.3n\                      " buffer number
" set statusline+=%f\                          " filename
" set statusline+=%h%m%r%w                     " status flags
" set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
" set statusline+=\ %{fugitive#statusline()}     " fugitive
" set statusline+=%=                           " right align remainder
" set statusline+=0x%-8B                       " character value
" set statusline+=%-14(%l,%c%V%)               " line, character
" set statusline+=%<%P                         " file position
set clipboard+=unnamedplus

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

let python_highlight_all = 1
" let g:Powerline_symbols = 'fancy'
" set rtp+=/Users/adam/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim


let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

set listchars=tab:>\ ,trail:•,extends:>,precedes:<,nbsp:+
set list

tnoremap <Leader>et <C-\><C-n>


map <right> :bn<cr>
map <left> :bp<cr>
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>st :terminal<CR>

set grepprg=ack
set grepformat=%f:%l:%m

map <leader>t :Files<CR>
map <leader>b :Buffers<CR>
map <leader>j :BTags<CR>
map <leader>J :Tags<CR>
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

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

let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['<', '>'], ['{', '}']]

let g:tagbar_type_rust = {
    \'ctagstype' : 'rust',
    \'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \]
  \}

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set backupdir=~/.vimbackup//,/tmp//
set directory=~/.vimswaps//,/tmp//

if has("vms")
  set nobackup    " do not keep a backup file, use versions instead
else
  set backup    " keep a backup file
endif
set history=500   " keep 50 lines of command line history
set ruler   " show the cursor position all the time
set showcmd   " display incomplete commands
set incsearch   " do incremental searching

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

autocmd! BufWritePost * Neomake

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

au VimEnter * RainbowParentheses

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

  set autoindent    " always set autoindenting on

  " Settings for raw text editing
endif " has("autocmd")

