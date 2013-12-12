"
" Natural vim
" ===========
"
" Author: Henrik Kjelsberg <hkjels@me.com> (http://take.no/)
" Version: 0.0.2
"

if exists('g:loaded_natural')
  finish
else
  let g:loaded_natural = 1
endif
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" I/O ------------------------------------------------------------------ {{{
  set ttyfast                         " Faster repeated editing
  set ttimeout                        " Use timeout for key sequence
  set ttimeoutlen=50                  " Time you have to complete a key sequence
  set mouse=a                         " Enable mouse-input
  set autowriteall                    " Save when shifting focus
  set autoread                        " Reload files changed outside of vim
  set visualbell                      " No bells!
  set noerrorbells                    " No whistles!
  set ffs=unix,dos,mac                " Default file types
  set backspace=indent,eol,start      " Make backspace behave normally.
  set modelines=0                     " Prevents modeline exploits
  set nostartofline                   " Keep cursor-position when switching buffers
  set backup                          " Turn on backup
  set backupdir=~/.vim/backup         " Where to store backup files
  set directory=~/.vim/swap           " Where to store swap files
" }}}

" Wild menu ------------------------------------------------------------ {{{
  if has("wildmenu")
    set wildmenu                             " Completions in a menu
    set wildmode=list:longest,full           " Fine grained completion
    set wildignore+=_darcs,.hg,.git,.svn     " Ignore vc directories

    " Case-insensitive completion
    if exists("&wildignorecase")
      set wildignorecase
    endif
  endif
" }}}

" Scratch -------------------------------------------------------------- {{{
  set hidden                          " Allow un-saved buffers in background
" }}}

" History -------------------------------------------------------------- {{{
  set history=32768                   " A longer history
  set undolevels=1000                 " Changing history is useful to
" }}}

" Aesthetics ----------------------------------------------------------- {{{
  set list listchars=tab:→\ ,trail:·  " Show 'invisible characters'
  set colorcolumn=76                  " Practice short code
  set number                          " Show line-numbers
  set nowrap                          " Don't wrap lines
  set guicursor+=a:blinkon0           " Disable the blinking cursor
  set showmatch                       " Show matching parenthesis
  set scrolloff=10                    " Keep the cursor close to center
  set sidescrolloff=10                " and middle
" }}}

" Search --------------------------------------------------------------- {{{
  set gdefault                        " Search with global by default
  set hlsearch                        " Highlight terms
  set smartcase                       " Ignore case if pattern is lowercase
  set incsearch                       " Show search matches as you type
" }}}

" Text editing --------------------------------------------------------- {{{
  set spell                           " Use spell-checker
  set encoding=utf-8                  " Default encoding
  set synmaxcol=500                   " Disable highlighting for lines longer than 500 chars
" }}}

" Indentation ---------------------------------------------------------- {{{
  set cindent                         " C indentation rules
  set autoindent                      " Indent based on ruleset of language
  set smartindent                     " Indent first line according to previous
  set smarttab                        " Use shiftwidth to emulate tabs
  set shiftround                      " Round indent to multiple of shiftwidth
" }}}

" Abbreviations -------------------------------------------------------- {{{
  " Open buffer in vertical-split
  cabbrev vb vert sb
" }}}

" Key-bindings --------------------------------------------------------- {{{
  " Navigate by row instead of line
  nnoremap j gj
  nnoremap k gk
  nnoremap gj j
  nnoremap gk k

  " Make yank´s behavior consistent
  nnoremap Y y$

  " Better focus on search matches
  nnoremap n nzzzv
  nnoremap N Nzzzv

  " Remove highlighted search-query with enter-key
  nnoremap <cr> :nohlsearch<cr>

  " Normalize regular-expression searches
  nnoremap / /\v
  vnoremap / /\v
  nnoremap ? ?\v
  vnoremap ? ?\v
  cnoremap s/ s/\v
  cnoremap s@ s@\v

  " Prevent de-select when indenting blocks
  vnoremap < <gv
  vnoremap > >gv
" }}}

