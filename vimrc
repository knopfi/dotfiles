" ========================================================================
" Vundle stuff
" ========================================================================
set nocompatible " Required by vundle
filetype off     " Required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle mange Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'

" Colors
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Use the colorscheme from above
set background=dark
colorscheme solarized

" ========================================================================
syntax on

let mapleader = ","

map <leader>vi :tabe ~/.vimrc<cr>

" ctrlp config
let g:ctrlp_map = '<leader>h'
let g:ctrlp_max_height = 10
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0

set autoindent                          " Copy indent from current line
set autoread                            " Read open files again when changed outside vim
set autowrite                           " Write a modified buffer on each :next , ...
set backspace=indent,eol,start          " Backspacing over everyhing in insert mode
set expandtab                           " Make vim use spaces and not tabs
set hidden                              " Don't unload the buffer when we switch between them. Saves undo history
set history=500                         " Keep 200 lines of command line history
set hlsearch                            " Highlight the last used search pattern
set ignorecase                          " Ignore case when searching....
set incsearch                           " Do incremental searching
set laststatus=2                        " always show status bar
set nobackup                            " Don't constantly write backup files
set noshowmode                          " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noswapfile                          " Ain't nobody got time for swap files
set noerrorbells                        " Don't beep
set nofoldenable
set nowrap                              " Do not wrap lines
set popt=left:8pc,right:3pc             " Print options
set ruler
set scrolloff=2                         " minimum lines above/below bar
set shell=bash                          " Required to let zsh knwo how to run things on command line
set shiftwidth=2                        " Number of spaces to use for each step of indent
set showbreak=↪\
set showcmd                             " Display incomplete commands in the bottom line of the screen
set showmatch
set synmaxcol=256
set smartcase                           " ...unless uppercase letter are used
set tabstop=2                           " Number of spaces that a <Tab> counts for
set undolevels=1000                     " Never can be too careful when it comes to undoing
set visualbell                          " Visual bell instead of beeping
set wildignore=*.swp,*.bak,*.class,tmp/**,dist/**,node_modules/**
set clipboard=unnamed
au BufNewFile,BufRead *.json set ft=javascript


au BufNewFile,BufRead *.txt setlocal nolist " Don't display whitespace

" Better? completion on command line
set wildmenu
" What to do when I press 'wildchar'. Worth tweaking to see what feels right.
set wildmode=list:longest,full

" (Hopefully) removes the delay when hitting sec in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

" Don't wait so long for the next keypress (particularly in ambigious Leader
" situations.
set timeoutlen=500

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Make it more obvious which paren I'm on
hi MatchParen cterm=none ctermbg=black ctermfg=yellow

" By default, vim thinks .md is Modula-2.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Wrap the quickfix window
autocmd FileType qf setlocal wrap linebreak

" ========================================================================

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim):
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
  augroup END
endif " has("autocmd")
