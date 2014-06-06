" use Tim Pope's pathogen
" execute pathogen#infect()
syntax on
"filetype plugin indent on

set laststatus=2
set wildmenu
set autoread
set number
set mouse=a
set cursorline
highlight CursorLine cterm=NONE ctermbg=grey
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
