imap jk <Esc>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Auto format
" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0
au BufWrite * :Autoformat
let g:formatter_yapf_style = 'google'
let g:formatdef_google = '"clang-format -style=Google"'
let g:formatters_cpp = ['google']
let g:formatters_c = ['google']

" let g:deoplete#enable_at_startup = 1

if &compatible
	set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.local/share/dein')
	call dein#begin('~/.local/share/dein')

	call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')
	call dein#add('Shougo/deoplete.nvim')
	call dein#add('tpope/vim-commentary')
	call dein#add('Chiel92/vim-autoformat')
	if !has('nvim')
		call dein#add('roxma/nvim-yarp')
		call dein#add('roxma/vim-hug-neovim-rpc')
	endif

	call dein#end()
	call dein#save_state()
endif

call deoplete#enable()

filetype plugin indent on
syntax enable
