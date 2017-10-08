"
" File:		.vimrc
" Author:	Hung, Zih Siou
" Modified:	2017 Apr 10
" INSTALLATION INSTRUCTIONS
"

" -------General setting------------------------------- {{{
" Use Vim settings, rather than vi.
" This must be first, because it changes other options as a side effect
set nocompatible

" Allow backspacing in insert mode
set backspace=indent,eol,start

set encoding=utf-8
set history=1000
set number
set ruler	" show the cursor position
set showcmd	" display incomplete commands
set incsearch
set hlsearch
set linebreak	" wrap line on 'word' boundaries
set scrolloff=3	" don't let cursor touch the edge of the viewpoint
set splitright
set splitbelow
" set colorcolumn=+0
"if exists('&breakindent')
  "set breakindent      " Indent wrapped lines up to the same level
"endif
set smartindent
set foldnestmax=2      " Only fold up to one level deep
"set list               " Show certain non-printing characters as printed
" Show potential matches above completion, complete first immediately
set wildmenu
set wildmode=full

" Tab settings
set expandtab          " Expand tabs into spaces
set tabstop=4          " default to 4 spaces for a hard tab
set softtabstop=4      " default to 4 spaces for the soft tab
set shiftwidth=4       " for when <TAB> is pressed at the beginning of a line

" }}}
" ----- Custom keybindings ---------------------------------------------- {{{

" Make navigating long, wrapped lines behave like normal lines
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> gk k
noremap <silent> gj j
noremap <silent> 0 g0
noremap <silent> g0 0
noremap <silent> $ g$
noremap <silent> g$ $
noremap <silent> ^ g^
noremap <silent> g^ ^
noremap <silent> _ g_

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Map jk in insert mode to get out
inoremap <silent> jk <ESC>

" Map folding (za) to Space
nnoremap <Space> za

" }}}
" ----- Not-quite-general-but-don't-belong-anywhere-else Settings ------- {{{

augroup vimrc
  " Clear the current autocmd group, in case we're re-sourcing the file
  au!

  " Jump to the last known cursor position when opening a file.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

augroup END

" }}}
" ----- Vundle and Plugin Settings ------------------------------------ {{{
filetype off    " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" ----- Making Vim look good ------------------------------------------
Plugin 'vim-airline/vim-airline'
Plugin 'altercation/vim-colors-solarized'

" ----- Vim as a programmer's text editor -----------------------------
Plugin 'scrooloose/syntastic'

" ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

"----- Working with javascript -----------------------------------------
Plugin 'pangloss/vim-javascript'

"----- Working with python ---------------------------------------------
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'

" ----- YouCompleteMe
"Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required
"set omnifunc=syntaxcomplete#Complete

" }}}

" ----- bling/vim-airline settings ----- {{{
" Show PASTE if in paste mode
let g:airline_detect_paste=1
" Don't take up extra space with +/-/~ of 0
let g:airline#extensions#hunks#non_zero_only = 1
" Limit wordcount to where it makes sense
let g:airline#extensions#wordcount#filetypes = '\vhelp|markdown|pandoc|rst|org'
" Always show statusbar
set laststatus=2
" Slightly modify the theme colors
let g:airline_solarized_normal_green = 1
" Fancy stuff in tabline as well
let g:airline#extensions#tabline#enabled = 1
" Disable this because it causes an issue with FZF + NeoVim
" https://github.com/neovim/neovim/issues/4487
let g:airline#extensions#branch#enabled = 0

" }}}

" ----- altercation/vim-colors-solarized settings ----- {{{
if !exists("g:syntax_on")
    syntax enable
endif

if $SOLARIZED ==? "dark"
  set background=dark
elseif $SOLARIZED == "light"
  set background=light
else
  set background=dark
  "set background=light
endif

" Uncomment the next line if your terminal is not configured for solarized
"let g:solarized_termcolors=256

" Set the colorscheme
colorscheme solarized

" }}}
" ----- scrooloose/syntastic settings --------- {{{
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
" For c++11
let g:syntaxstic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

let g:syntastic_python_checkers=['pyflakes']
" }}}


" ------ tmhedberg/SimpylFold settings ------------ {{{
let g:SimpylFold_docstring_preview = 1

" ------- YouCompleteMe setting -------------------{{{
"let g:ycm_python_binary_path = 'python'
