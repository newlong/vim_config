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

set autoindent
set completeopt=longest,menu

syntax enable
syntax on


"check php syntax
function! PhpCheckSyntax()
    setlocal makeprg=\/usr/local/php/bin/php\ -l\ -n\ -d\ html_errors=off\ %
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l
    make %
endfunction

autocmd BufWritePost *.php :call PhpCheckSyntax()
"autocmd BufWritePost *.js :make

"check js syntax
function! JsCheckSyntax()
    setlocal makeprg=\/usr/local/nodejs/bin/jslint\ %
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l
    make
endfunction

let s:showmakeWnd = "0"
function! JsLintCheckSyntax()
    setlocal makeprg=\/usr/local/nodejs/bin/jslint\ %
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l
    "setlocal errorformat=%f:%l:%c:%m

    if s:showmakeWnd == "0"
        make
    else
        cclose
    endif

    let s:showmakeWnd = (s:showmakeWnd == "0" ? "1" : "0")
endfunction

autocmd BufWritePost *.js :call JsCheckSyntax()
"autocmd BufWritePost *.js :call JsLintCheckSyntax()


