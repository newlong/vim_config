set nocompatible
set fileencodings=utf-8,gbk

:set number

:colorscheme desert
":colorscheme distinguished


set hlsearch
set cursorline
"highlight CursorLine guibg=lightblue ctermbg=lightgray

"set cursorcolumn

set expandtab
set tabstop=4
set shiftwidth=4

set encoding=utf-8

filetype indent on
filetype plugin on
filetype plugin indent on
"autocmd filetype FileType python set omnifunc=pythoncomplete#Complete
"autocmd filetype FileType php set omnifunc=phpcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType php set omnifunc=phpcomplete#Complete

autocmd FileType php set completefunc=phpcomplete#CompletePHP

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

"2013-04-13
function! JsCheckOfjavascriptLint()
    "setlocal makeprg=\/usr/local/jsl/jsl\ -nologo\ -nofilelisting\ -nosummary\ -nocontext\ -conf\ '/usr/local/jsl/jsl.conf'\ -process\ %
    setlocal makeprg=\/usr/local/jsl/jsl\ -nologo\ -nofilelisting\ -conf\ '/usr/local/jsl/jsl.conf'\ -process\ %
    setlocal errorformat=%f(%l):\ %m
    make
endfunction

function! SftpFileToServer()
    "echo getcwd()
    let root_path = getcwd()
    let sftp_cmd = "!/home/dragon/vim_plugins/sftp_server.sh '".root_path."' '%:p' &" 
    execute sftp_cmd
    "!/home/dragon/vim_plugins/sftp_server.sh root_path current_file
endfunction

function! RebuildTags()
    let root_path = getcwd()
    "let cmd = "!/home/dragon/vim_plugins/rebuild_tag.sh '".root_path."' &" 
    let cmd = "!/home/dragon/vim_plugins/rebuild_code_index.py '".root_path."' &" 
    execute cmd
endfunction

"autocmd BufWritePost *.js :call JsCheckSyntax()
"autocmd BufWritePost *.js :call JsLintCheckSyntax()

autocmd BufWritePost *.js :call JsCheckOfjavascriptLint()

autocmd BufWritePost *.* :call SftpFileToServer()
autocmd BufWritePost *.* :call RebuildTags()

let g:user_zen_expandabbr_key = '<F2>'

nnoremap <F4> :call g:Jsbeautify()<CR>

"au FileType php call AutoCompleteFunction()
"function! AutoCompleteFunction()
"    set dictionary-=/home/dragon/vim_plugins/php_function_list.txt
"    set dictionary+=/home/dragon/vim_plugins/php_function_list.txt
"
"    set complete-=k
"    set complete+=k
"endfunction
