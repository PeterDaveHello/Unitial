" charset
set encoding=utf-8
set fileencoding=utf-8 "fenc ,default save charset
set fileencodings=utf-8,big5,default "fencs, default opening charset priority

" enable features which are not Vi compatible but really really nice.
set nocompatible "nocp

" expand TABs to spaces
set expandtab "et
" set TAB's width
set tabstop=4 "ts
" auto indent width
set shiftwidth=4 "sw

" use the indent of the previous line for a newly created line
set autoindent "ai

" 256 color mode
set t_Co=256

" show the ruler for the cursor
set ruler "ru
" show line numbers
set number "nu

" show the search results before stop typing
set incsearch "is
" highlight search results
set hlsearch "hls
" case-insensitive search
set ignorecase "ic

" enable backspace in insert mode
set backspace=2 "bs

" set statusbar
set statusline+=%*
set statusline+=%f              "filename
set statusline+=%m              "modified flag
set statusline+=%r              "read only flag
set statusline+=\ \%y           "filetype
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%=              "left/right separator
set statusline+=%*              "show the errors/warning in the status line
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%=              "left/right separator
set statusline+=%h\ \           "help file flag
set statusline+=%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}
set statusline+=[%l,%c]         "cursor line,column
set statusline+=\ \[%L\ lines\] "total lines
set statusline+=\ [%P]          "percent through file

" display a status line at the bottom of the window
set laststatus=2

" highlight syntax
syntax on

" color scheme
colorscheme kolor

" make whitespaces and TABs visible
set list "l
set listchars=tab:>-,trail:·"lcs
highlight SpecialKey guifg=DarkGray

" map hot key <Ctrl>+n to switch if shows line numbers
map <C-n> :set nu!<BAR>set nu?<CR>

"===  IF YOU WANT TO USE THE FOLLOWING FEATURE, PLEASE UNCOMMENT IT BY YOURSELF ==="

" remember and go to the last used location automatically.
"au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

