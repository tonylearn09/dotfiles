"
" File:		.vimrc
" Author:	Hung, Zih Siou
" Modified:	2017 Apr 10
" INSTALLATION INSTRUCTIONS
"
" Presumably, you've gotten your hands on this file because you forked my
" dotfiles repository. I keep all my Vim plugins as submodules, so after you
" clone you'll have to run
"
"     $ git submodule init
"     $ git submodule update
"
" to grab the required dependencies. Once you've done this, you can either
" manually move the `vimrc` file to `~/.vimrc` and the `vim/` folder to
" `~/.vim`, or you can be a little smarter and use a tool like rcm
" (https://github.com/thought


" -------General setting------------------------------- {{{
" Use Vim settings, rather than vi.
" This must be first, because it changes other options as a side effect
set nocompatible

" Allow backspacing in insert mode
set backspace=indent,eol,start

set history=1000
set number
set ruler	" show the cursor position
set showcmd	" display incomplete commands
set incsearch
set linebreak	" wrap line on 'word' boundaries
set scrolloff=3	" don't let cursor touch the edge of the viewpoint
set splitright
set splitbelow
" set colorcolumn=+0
if exists('&breakindent')
  set breakindent      " Indent wrapped lines up to the same level
endif
set foldnestmax=1      " Only fold up to one level deep
set list               " Show certain non-printing characters as printed
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

" Map jk in insert mode to get out
inoremap <silent> jk <ESC>

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
" ----- Filetype Settings ----------------------------------------------- {{{

" Enable file type detection.
filetype plugin indent on
" }}}
" ----- Vundle and Plugin Settings ------------------------------------ {{{

