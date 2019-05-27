" Specify a directory for plugins (powered by vim-plug)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
 Plug 'lambdalisue/suda.vim'
 Plug 'powerman/vim-plugin-ruscmd'
 Plug 'tpope/vim-fugitive'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'
 Plug 'djoshea/vim-autoread'
 Plug 'lervag/vimtex'
 Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
 Plug 'dart-lang/dart-vim-plugin'
 Plug 'natebosch/vim-lsc'
 Plug 'elixir-editors/vim-elixir'
 Plug 'slashmili/alchemist.vim'
 Plug 'scrooloose/nerdtree'
" Plug 'plytophogy/vim-virtualenv'

 if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
 endif
 Plug 'zchee/deoplete-jedi'
 Plug 'davidhalter/jedi-vim'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'

let g:deoplete#enable_at_startup = 1

" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#use_tabs_not_buffers = 1

" Initialize plugin system
call plug#end()

set guioptions-=T  "remove toolbar

let g:python3_host_prog = '/usr/bin/python'  " Python 3
let g:loaded_python_provider = 1  " Disable Python 2 support

" UltiSnips group
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/vim-snippets/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" vimtex group (view settings according to vimtex.txt; stands perfectly to reason)
let g:vimtex_view_method = 'general'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
    \ 'background' : 1,
    \ 'continuous' : 1,
\}

"set invspell spelllang=ru_ru,en_us
set spelllang=ru_ru,en_us

set laststatus=2
set tabstop=4
set expandtab
set shiftwidth=4
set number
if has('nvim')
 set clipboard=unnamedplus
endif

autocmd FileType help noremap <buffer> q :q<cr>
" command! -nargs=0 Sw w !sudo tee % > /dev/null
" command W w !sudo tee "%" > /dev/null

let dart_style_guide = 2
let dart_format_on_save = 1
" let dart_corelib_highlight=v:false

let g:lsc_server_commands = {'dart': 'dart_language_server'}
let g:lsc_auto_map = v:true
" let g:lsc_reference_highlights = v:false
set completeopt-=preview

" Toggle line wrap
nnoremap 66 :set wrap!<CR>
" Toggle spell check
nnoremap 55 :set invspell<CR>
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
inoremap ОО ---~
inoremap ЛЛ ~---~
inoremap ББ <<
inoremap ЮЮ >>
