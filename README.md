# .vim

Personal `.vimrc`, color schema, scripts and settings.

> Currently, under transition to vim-plug from neobundle


## Repository

https://gitlab.com/grauwoelfchen/DotVim


## Setup

```zsh
% cd
% git clone git@gitlab.com:grauwoelfchen/dotvim.git .vim
% cd .vim
% mkdir .{backup,swap}
% ln -s ~/.vim/.vimrc ~/.vimrc
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

### neobundle

Setup neobundle as submodule.

```zsh
% git submodule update --init
```

And then, install all dependencies via `neobundle` which is installed as
submodule.

```
% vim
:NeoBundleInstall
```


## License

`GPL-2.0`

```
.vim
Copyright (c) 2010-2018 Yasuhiro Asaka
```

This is free software:  
You can redistribute it and/or modify it under the terms of
the GUN General Public License as published by the
Free Software Foundation.

See [LICENSE](LICENSE).
