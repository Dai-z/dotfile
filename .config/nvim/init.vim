set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set autoindent              " Carry over indenting from previous line
set smartindent
set copyindent
autocmd CompleteDone * if pumvisible() == 0 | pclose | endif

" Auto format
" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0
au BufWrite * :Autoformat
let g:formatters_cpp = ['yapf']
let g:formatter_yapf_style = 'google'
let g:formatdef_google = '"clang-format -style=Google"'
let g:formatters_cpp = ['google']
let g:formatters_c = ['google']

if &compatible
    set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=/home/daiz/.local/share/dein/repos/github.com/Shougo/dein.vim

"" Key map
imap jk <Esc>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

"" Deoplete
let g:deoplete#auto_complete_delay = 0
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#auto_refresh_delay = 100
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 10000

"" Sources
let g:deoplete#sources#jedi#statement_length = 0
let g:deoplete#sources#jedi#short_types = 0
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#worker_threads = 2

let g:deoplete#enable_at_startup = 1
if dein#load_state('/home/daiz/.local/share/dein')
    call dein#begin('/home/daiz/.local/share/dein')

    call dein#add('/home/daiz/.local/share/dein/repos/github.com/Shougo/dein.vim')

    call dein#add('Shougo/deoplete.nvim')
    "" Deoplete sources:
    call dein#add('zchee/deoplete-jedi', {'on_ft': ['python', 'cython', 'pyrex']})

    call dein#add('tpope/vim-commentary')
    call dein#add('Chiel92/vim-autoformat')
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable
