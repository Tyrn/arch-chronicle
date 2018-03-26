" Specify a directory for plugins (powered by vim-plug)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
 Plug 'powerman/vim-plugin-ruscmd'
 Plug 'tpope/vim-fugitive'
 Plug 'xolox/vim-misc'
 Plug 'xolox/vim-session'
 Plug 'lervag/vimtex'

" Initialize plugin system
call plug#end()

set guioptions-=T  "remove toolbar

" vimtex group (view settings according to vimtex.txt; stands perfectly to reason)
let g:vimtex_view_method = 'general'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
    \ 'background' : 1,
    \ 'continuous' : 0,
\}

"set spell spelllang=ru_ru
set spelllang=ru_ru

set laststatus=2
set tabstop=4
set expandtab
set shiftwidth=4
set number

" Weird things
nnoremap 00 $
nnoremap ѵѵ $
nnoremap ѵ 0
nnoremap ѱ G
" Tab management
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
" General commands remapped to Insert Mode
inoremap <c-s> <Esc>:w<CR>
inoremap SS <Esc>S
inoremap DD <Esc>dd
inoremap ЫЫ <Esc>S
inoremap ВВ <Esc>dd
" Escape remapped
inoremap w; <Esc>
inoremap ;w <Esc>
inoremap цж <Esc>
inoremap жц <Esc>
" vimtex miscellany
map <F5> :VimtexCompile<CR>
map <F6> :VimtexView<CR>
" LaTeX and Slavonic miscellany
inoremap YY {\slv{}}
inoremap НН {\slv{}}
inoremap NN \textbf{}
inoremap ТТ \textbf{}
inoremap II \emph{}
inoremap ШШ \emph{}
inoremap OO {}
inoremap ЩЩ {}
inoremap PP ~\textemdash~
inoremap ЗЗ ~\textemdash~
inoremap LL \ldots{}
inoremap ДД \ldots{}
"Russian speciality
inoremap ОО ---~
inoremap ЛЛ ~---~
inoremap ББ <<
inoremap ЮЮ >>

