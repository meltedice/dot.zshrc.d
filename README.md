# .zshrc.d

## Setup prezto

```zsh
% git clone git@github.com:meltedice/dot.zshrc.d.git ~/.zshrc.d
% cd ~/.zshrc.d
% git submodule init
% git submodule update --init --recursive
% cd
% setopt EXTENDED_GLOB
% for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
%   ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
% done
% ln -snf ~/.zshrc.d/prezto    ~/.zprezto
% ln -snf ~/.zshrc.d/zpreztorc ~/.zpreztorc
```
## OLD Setup

``` zsh
cd /path/to/this/directory
cp .zshrc ~/.zshrc
```
## ~/.zpreztorc

Just copied from prezto/runcoms/zpreztorc
