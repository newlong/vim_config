:set number

:colorscheme desert
":colorscheme distinguished


set hlsearch
"set cursorline
"highlight CursorLine guibg=lightblue ctermbg=lightgray

"set cursorcolumn

set expandtab
set tabstop=4
set shiftwidth=4

filetype indent on
:filetype plugin on
filetype plugin indent on
autocmd filetype FileType python set omnifunc=pythoncomplete#Complete
autocmd filetype FileType php set omnifunc=phpcomplete#Complete
