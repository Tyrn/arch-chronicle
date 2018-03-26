## GitHub
#### Resources

- [Eclipse & Git: Mind your Windows line endings!](http://mike.meessen.biz/blog/?p=368)

- [Force LF eol in git repo and working copy](https://stackoverflow.com/questions/9976986/force-lf-eol-in-git-repo-and-working-copy)

#### Credentials on the workstation

- Set softlinks
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
