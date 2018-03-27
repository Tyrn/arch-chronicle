## GitHub
#### Resources

- [Eclipse & Git: Mind your Windows line endings!](http://mike.meessen.biz/blog/?p=368)

- [Force LF eol in git repo and working copy](https://stackoverflow.com/questions/9976986/force-lf-eol-in-git-repo-and-working-copy)

- [Dealing with line endings, official](https://help.github.com/articles/dealing-with-line-endings/)

- [Line ending thing that works](https://coderwall.com/p/dzdw_a/converting-line-endings-from-dos-carriage-returns-to-unix-line-feeds-using-git)

#### Credentials on the workstation

- Set softlinks (not quite safe)
```
$ rm -f /home/alexey/.netrc; ln -s /home/alexey/.net-rc/netrc-Alexey-Orlov /home/alexey/.netrc
$ rm -f /home/alexey/.netrc; ln -s /home/alexey/.net-rc/netrc-Tyrn /home/alexey/.netrc
```

`~/.net-rc/netrc-Tyrn`
```
machine github.com
login Tyrn
password pwda
```
`~/.net-rc/netrc-Alexey-Orlov`
```
machine github.com
login Alexey-Orlov
password pwdb
```
- [What is the best practice for dealing with passwords in github?](https://stackoverflow.com/questions/2397822/what-is-the-best-practice-for-dealing-with-passwords-in-github)