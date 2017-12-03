# .vim

Personal `.vimrc`, color schema, scripts and settings.


## Repository

https://gitlab.com/grauwoelfchen/DotVim


## Setup

```zsh
% cd
% git clone git@gitlab.com:grauwoelfchen/dotvim.git .vim
% cd .vim
% mkdir .{backup,swap}
% git submodule update --init
% ln -s ~/.vim/.vimrc ~/.vimrc
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
Copyright (c) 2010-2017 Yasuhiro Asaka
```

This is free software:  
You can redistribute it and/or modify it under the terms of
the GUN General Public License as published by the
Free Software Foundation.

See [LICENSE](LICENSE).
