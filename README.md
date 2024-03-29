# .vim

This contains my personal `.vimrc`, color schema, scripts and
settings by using _autoload_ and _ftplugin_ etc.

The main `.vimrc` is kept maintaining under less than 500 lines.

```zsh
% make lint
```

## Repositories

* [GitLab.com](https://gitlab.com/grauwoelfchen/DotVim)
* [GitHub](https://gitlab.com/grauwoelfchen/.vim)
* [Sourcehut](https://git.sr.ht/~grauwoelfchen/.vim)

## Setup

```zsh
% cd
% git clone git@gitlab.com:grauwoelfchen/dotvim.git .vim
% cd .vim
% mkdir .{backup,swap}
% ln -s ~/.vim/.vimrc ~/.vimrc
% ln -s ~/.vim/.vintrc.yaml ~/.vintrc.yaml
```

### vim-plug

Put plug.vim into `~/.vim/autoload`.

```zsh
% curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

And then, install all dependencies via `vim-plug` which is downloaded with
above command.

```
% vim
:PlugInstall
```

### Other plugins

Some lsp related plugins or scripts require external binaries and/or source
code etc. So, setup them.

* `rust-analyzer`, `rust-src`
* `rls` (rustup)
* `gopls`, `go-langserver`
* `typescript-language-server`
* `pyls`


## License

`GPL-2.0`

```
.vim
Copyright (c) 2010-2021 Yasuhiro Яша Asaka

This is free software:
You can redistribute it and/or modify it under the terms of
the GUN General Public License as published by the
Free Software Foundation.
```

See [LICENSE](LICENSE).
