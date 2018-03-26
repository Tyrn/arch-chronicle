## LaTeX

#### Tex Live, manual installation:

- Remove `texlive-bin`:
```
$ sudo pacman -R texlive-bin
```
- Trim whatever remains:
```
$ fmtutil-sys --all
```
- Install texlive: [TUG.org](https://tug.org/texlive/doc/texlive-en/texlive-en.html#x1-140003); [discussion](https://bbs.archlinux.org/viewtopic.php?id=181749)

- add your texlive path to `~/.profile`(do not use `~/.bashrc`!):
```
export PATH=/home/user/.local/share/texlive/2016/bin/x86_64-linux:$PATH
```

#### TeXstudio:
To restore a saved profile:

- Delete `~/.config/texstudio/texstudio.ini`
- Copy your `*.txsprofile` to `texstudio.ini`

#### Cheat sheet example:
```
https://github.com/pmiossec/tig-cheat-sheet
```

#### 2017-12-29

`~/.latexmkrc`:
```
$pdf_mode = 1;
$pdflatex = 'xelatex -interaction=nonstopmode -synctex=1';
$pdf_previewer = 'okular --unique';
```

#### PDF

- LaTeX, pdfpages; extracting pages 167..173 from ScalaReference.pdf
```
$ pdfjam -o scala_syntax_167_173.pdf ScalaReference.pdf 167,168,169,170,171,172,173

$ pdfjam -o scala_syntax_167_173.pdf ScalaReference.pdf 167-173
```
