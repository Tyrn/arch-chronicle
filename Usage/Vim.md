## Vim Editor
*Neovim, mostly*

#### IntelliJ IDEA, IdeaVim plugin
`~/.ideavimrc`:
```
set clipboard+=unnamed
```

#### sudo
```
$ sudo -E nvim
```
#### Plugin functionality support

- [TSUpdate error, related to nvim-treesitter plugin](https://github.com/nvim-treesitter/nvim-treesitter/issues/913)
```
$ sudo pacman -S python-pynvim
$ sudo pacman -S python-jedi
$ sudo pacman -S npm
```
#### Spell checking
- `init.vim`:
```
set spelllang=ru_ru,en_us,es_es
nmap <leader>ss :set invspell<CR>
```
#### Clipboard

- Install `xclip` (or `xsel`)

- Add to `init.vim` to avoid printing `"+y` for the system clipboard:
```
set clipboard=unnamedplus
```

#### Sharing plugins with Vim

- [Arch Wiki](https://wiki.archlinux.org/index.php/Neovim), [Color scheme, etc.](https://vi.stackexchange.com/questions/12794/how-to-share-config-between-vim-and-neovim)


#### Inhouse config (based on [Guillaume Quittet](https://github.com/gquittet/dotfiles/tree/master/nvim/.config/nvim)'s setup)

- `$ cd ~/.config`

- `$ git clone https://github.com/Tyrn/arch-chronicle`

- `$ ln -s /home/user/.config/arch-chronicle/nvim /home/user/.config/nvim`

#### Python support (legacy)

[A Complete Guide for Installing and Setting up Neovim for Python Development](https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/) (Cocless)

### VimTeX

[Superfluous viewer instances](https://github.com/lervag/vimtex/issues/313)

[**Configuration issue**](https://github.com/lervag/vimtex/issues/1392)

#### Okular

- Vim/Okular interaction (Okular > Settings > Editor > Command):
```
gvim --servername GVIM --remote-silent +%l %f
```
- Neovim/Okular, [neovim-remote installed](https://github.com/mhinz/neovim-remote):
```
nvr --remote-silent %f -c %l
```
*Shift+Left Click*; with Okular working only in *Browse* mode.

### Revamping [Guillaume Quittet](https://github.com/gquittet/dotfiles/tree/master/nvim/.config/nvim)'s setup
This powerful, yet concise and readable, Neovim setup is based on [Coc](https://github.com/neoclide/coc.nvim); highly recommended. Tailoring it to (my) personal needs:

- Install Neovim [nightly](https://github.com/neovim/neovim/releases/nightly) release (v0.4 or greater is essential)

- Install a [Nerd Font](https://www.nerdfonts.com/font-downloads) (*FiraMono Nerd Font* will do); [howto](https://gist.github.com/matthewjberger/7dd7e079f282f8138a9dc3b045ebefa0)

- Ensure [vim-plug](https://github.com/junegunn/vim-plug) to be installed (Auto install may fail):
```
$ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
- In case of errors on start:
```
:PlugInstall
```
- Create backup folder:
```
$ mkdir ~/.local/share/nvim/backup
```
- Add [vim-plugin-ruscmd](https://github.com/powerman/vim-plugin-ruscmd) to `~/.config/nvim/plugged.vim`:
```
Plug 'powerman/vim-plugin-ruscmd'
```
- Add Coc extensions you need to `~/.config/nvim/plugged.vim`, function `InstallDeps()`:
```
            ...
            \'coc-highlight',
            \'coc-prettier',
            ...
            \'coc-python',
            \'coc-rls',
            \'coc-elixir',
```
NB Adding Coc extensions to `InstallDeps()` may be insufficient; in case the language server won't work, `:CocInstall coc-python` may help. `:CocInstall coc-python` apparently takes care of the necessary Python dependencies. See also [#54](https://github.com/neoclide/coc-python/issues/54).

- Create `~/.config/nvim/configs/friday.vim`;
- Add `friday.vim` to `~/.config/nvim/init.vim` at the end:
```
runtime plugged.vim
runtime configs/global.vim
runtime configs/keymap.vim
runtime configs/plugins.vim
runtime configs/spell.vim
runtime configs/theme.vim
runtime configs/friday.vim
```
- Add to`friday.vim` whatever you need, like this:
```
if has('nvim')
 set clipboard=unnamedplus
endif

let g:airline_theme='base16_adwaita'

"set cmdheight=1

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=150

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsSnippetDirectories=[$HOME.'/.../plugged/vim-snippets/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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
```

#### Troubleshooting coc-based installation

- In Neovim: `:checkhealth provider`
