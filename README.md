Nany Syntax for Vim
===================

[Nany Programming Language](//github.com/nany-lang/nany)


Install
-------

The simplest way to install is via a Vim add-in manager such as
[Plug](//github.com/junegunn/vim-plug),
[Vundle](//github.com/VundleVim/Vundle.vim) or
[Pathogen](//github.com/tpope/vim-pathogen/).


### Vundle

Put this in your `.vimrc` to use nany syntax:

```VimL
Plugin 'nany-lang/nany-syntax-vim'
```


### Manual install

```VimL
autocmd BufRead,BufNewFile *.ny,*.pny setlocal filetype=nany
```
