# Go
set -gx GOPATH ~/Code/go
set -gx PATH $GOPATH/bin $PATH

# Rust
set -gx PATH ~/.cargo/bin $PATH
set -gx RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src

# Local path
set -gx PATH ~/.local/bin $PATH

set -gx EDITOR vim
set -gx VISUAL $EDITOR
set -gx BROWSER firefox

# Ruby gems path
# set -gx PATH (ruby -e 'print Gem.user_dir')/bin $PATH
set -gx PATH $HOME/bin $PATH

# nvim instead of vim
alias vim "nvim"
alias v "nvim"

# trash instead of rm
alias rm "trash"

# exa instead of ls
alias ls "exa"

# sudo vim
alias svim "sudo -E nvim"
alias sv "sudo -E nvim"

# source init.fish
alias fe "nvim ~/.config/omf/init.fish"
alias fs "source ~/.config/omf/init.fish"
alias ve "nvim ~/.config/nvim/init.vim"
alias ie "nvim ~/.config/i3/config"

alias asuup "nmcli conn up asu --ask"
