if has('nvim')
 set clipboard=unnamedplus
endif

let g:airline_theme='base16_adwaita'

" vimtex group (view settings according to vimtex.txt; stands perfectly to reason)
"
let g:polyglot_disabled = ['latex']

let g:vimtex_view_method = 'general'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
    \ 'background' : 1,
    \ 'continuous' : 1,
\}

set spelllang=ru_ru,en_us

" Toggle spell check
nnoremap 55 :set invspell<CR>
" Toggle line wrap
nnoremap 66 :set wrap!<CR>
" Weird things
" nnoremap 00 $
" nnoremap ѵѵ $
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
inoremap wñ <Esc>
inoremap ñw <Esc>
" Russian dollar
nnoremap ; $
" Spanish colon
nnoremap Ñ :
" vimtex miscellany
nnoremap 77 :VimtexCompile<CR>
nnoremap 88 :VimtexView<CR>
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
inoremap JJ ---~
inoremap ОО ---~
inoremap KK ~---~
inoremap ЛЛ ~---~
inoremap ББ <<
inoremap ЮЮ >>
