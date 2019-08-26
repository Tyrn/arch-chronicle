" Specify a directory for plugins (powered by vim-plug)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

 Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
 Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
 Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
 Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
 Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
 Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
 Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
 Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'} " mru and stuff
 Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " color highlighting
 Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}

 Plug 'powerman/vim-plugin-ruscmd'
 Plug 'tpope/vim-fugitive'
 Plug 'djoshea/vim-autoread'
 Plug 'lervag/vimtex'
 Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
 Plug 'dart-lang/dart-vim-plugin'
 Plug 'natebosch/vim-lsc'
 Plug 'elixir-editors/vim-elixir'
 Plug 'slashmili/alchemist.vim'
 Plug 'scrooloose/nerdtree'

" if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
" endif
" Plug 'zchee/deoplete-jedi'
" Plug 'davidhalter/jedi-vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
"
"let g:deoplete#enable_at_startup = 1
"
"" disable autocompletion, cause we use deoplete for completion
"let g:jedi#completions_enabled = 0
"
"" open the go-to function in split, not another buffer
"let g:jedi#use_splits_not_buffers = "right"
"let g:jedi#use_tabs_not_buffers = 1

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


" \/ Example vim CoC configuration https://www.jishuwen.com/d/2ydz/zh-hk

" if hidden is not set, TextEdit might fail.
set hidden

" Better display for messages
set cmdheight=1

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=150

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd :call CocAction('jumpDefinition', 'tab drop')<CR>
"nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }



" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" /\ Example vim configuration 


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
