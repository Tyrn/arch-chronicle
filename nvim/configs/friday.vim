if has('nvim')
 set clipboard=unnamedplus
endif

let g:airline_theme='base16_adwaita'

"set cmdheight=1

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=150
"set synmaxcol=512

nmap <leader>тр :nohl<CR>

" Undo tree
nmap <Leader>uh :UndotreeToggle<CR>
nmap <Leader>гр :UndotreeToggle<CR>

" Buffers remapped too.
nmap <leader>ат :bnext<CR>
nmap <leader>аз :bprevious<CR>
nmap <leader>аа :bfirst<CR>
nmap <leader>ав :bdelete<CR>

" Crude access to the buffer list.
:nmap <leader>sf :ls!<CR>:b<Space>
:nmap <leader>ыа :ls!<CR>:b<Space>

" Splitting windows
nmap <leader>vv :vs<CR>
nmap <leader>vh :sp<CR>

nmap <leader>мм :vs<CR>
nmap <leader>мр :sp<CR>

" Split windows navigation.
:nmap <leader>h :wincmd h<CR>
:nmap <leader>j :wincmd j<CR>
:nmap <leader>k :wincmd k<CR>
:nmap <leader>l :wincmd l<CR>

:nmap <leader>р :wincmd h<CR>
:nmap <leader>о :wincmd j<CR>
:nmap <leader>л :wincmd k<CR>
:nmap <leader>д :wincmd l<CR>

" Leave only current window.
:nmap <leader>so <c-w>o
:nmap <leader>ыщ <c-w>o

" Resize current window.
:nmap <leader>sp :vertical resize +5<CR>
:nmap <leader>sm :vertical resize -5<CR>
:nmap <leader>spp :vertical resize +12<CR>
:nmap <leader>smm :vertical resize -12<CR>
:nmap <leader>sP :resize +5<CR>
:nmap <leader>sM :resize -5<CR>

:nmap <leader>ыз :vertical resize +5<CR>
:nmap <leader>ыь :vertical resize -5<CR>
:nmap <leader>ызз :vertical resize +12<CR>
:nmap <leader>ыьь :vertical resize -12<CR>
:nmap <leader>ыЗ :resize +5<CR>
:nmap <leader>ыЬ :resize -5<CR>

" vimtex settings.
:nmap <localleader>дш :VimtexInfo<CR>                   " li
:nmap <localleader>дШ :VimtexInfo!<CR>                  " lI
:nmap <localleader>де :VimtexTocOpen<CR>                " lt
:nmap <localleader>дЕ :VimtexTocToggle<CR>              " lT
:nmap <localleader>дй :VimtexLog<CR>                    " lq
:nmap <localleader>дм :VimtexView<CR>                   " lv
:nmap <localleader>дк :VimtexRSearch<CR>                " lr
:nmap <localleader>дд :VimtexCompile<CR>                " ll
:nmap <localleader>дД :VimtexCompileSelected<CR>        " lL
:nmap <localleader>дл :VimtexStop<CR>                   " lk
:nmap <localleader>дЛ :VimtexStopAll<CR>                " lK
:nmap <localleader>ду :VimtexErrors<CR>                 " le
:nmap <localleader>дщ :VimtexCompileOutput<CR>          " lo
:nmap <localleader>дп :VimtexStatus<CR>                 " lg
:nmap <localleader>дП :VimtexStatus!<CR>                " lG
:nmap <localleader>дс :VimtexClean<CR>                  " lc
:nmap <localleader>дС :VimtexClean!<CR>                 " lC
:nmap <localleader>дь :VimtexImapsList<CR>              " lm
:nmap <localleader>дч :VimtexReload<CR>                 " lx
:nmap <localleader>дЧ :VimtexReloadState<CR>            " lX
:nmap <localleader>ды :VimtexToggleMain<CR>             " ls

let g:polyglot_disabled = ['latex']

let g:vimtex_view_method = 'general'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
    \ 'background' : 1,
    \ 'continuous' : 1,
\}

set spelllang=ru_ru,en_us,es_es

" Toggle spell check
nmap <leader>ss :set invspell<CR>
nmap <leader>ыы :set invspell<CR>
" Toggle line wrap
nmap <leader>sw :set wrap!<CR>
nmap <leader>ыц :set wrap!<CR>


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
" Russian slash
nnoremap . /
" Spanish slash
nnoremap - /
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
inoremap HH ---~
inoremap РР ---~
inoremap JJ ~---~
inoremap ОО ~---~
inoremap ББ <<
inoremap ЮЮ >>
inoremap БББ «
inoremap ЮЮЮ »
inoremap ññ «
inoremap ÑÑ »
