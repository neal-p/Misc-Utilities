" persistant undo/redo
" dir might need to exist
set undodir=~/.vim/undodir
set nobackup

" Forced to write readable code :)
set nowrap

" Best of both worlds for numbers
set number relativenumber

" syntax hilighting
syntax on
filetype on
filetype indent on

" highlight the current line you are on
set cursorline
:highlight Cursorline cterm=bold ctermbg=black

" Searching
set hlsearch
set ignorecase
set smartcase
" set incsearch - dont always want this, it starts jumping as you type the search

" related to spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" make sure mouse is off
set mouse-=a

" who matched pairs [] () etc
set showmatch

" finding commands with tab complete menu
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" make it easier to hit esc in other modes
inoremap mm <esc>
vnoremap mm <esc>

" You can split the window in Vim by typing :split or :vsplit.
" easier moving between splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END
