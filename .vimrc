" for Vundle to organize the plugin
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'altercation/vim-colors-solarized'
Plugin 'taglist.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" here start my own .vimrc


"for fugitive
set diffopt+=vertical

syntax on
"filetype plugin indent on

set laststatus=2
set wildmenu
set autoread
set number
set mouse=a
set cursorline
" highlight CursorLine cterm=NONE ctermbg=grey
set hidden

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
" IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
set grepprg=grep\ -nH\ $*
" OPTIONAL: This enables automatic indentation as you type.
filetype indent on
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
"turn on omnicompletion
set ofu=syntaxcomplete#Complete
"use okular to view dvi file, better search support
let g:Tex_ViewRule_dvi = 'okular'

syn sync fromstart
"about the folding
set foldmethod=syntax
set foldlevelstart=20
set incsearch

" for solarized
syntax enable
" if has('gui_running')
"     set background=light
" else
"     set background=dark
" endif
set background=light
let g:solarized_termcolors=256
colorscheme solarized

"Enable and disable mouse use
noremap <f12> :call ToggleMouse() <CR>
function! ToggleMouse()
if &mouse == 'a'
set mouse=
set nonumber
echo "Mouse usage disabled"
else
set mouse=a
set number
echo "Mouse usage enabled"
endif
endfunction

" for git commit message
autocmd Filetype gitcommit setlocal spell textwidth=72
