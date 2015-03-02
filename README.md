qjw's .vimrc
===

This repository is to keep my .vimrc synced across different computers

### You are welcomed to clone and make your own .vimrc

How to use
===
* `git clone` this repository to somewhere on harddisk
* symbolic link `vimrc` in repository to `~/.vimrc` (or `_vimrc` on Windows)
```
# on Windows, assuming you use Administrator like I did
mklink ./vimrc C:\Users\Administrator\_vimrc 
# on Linux
ln -s ~/.vimrc ./vimrc
```
* after this, do anything you want to `~/.vimrc`, then `git push/pull`
 