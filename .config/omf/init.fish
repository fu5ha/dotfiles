# Go
set -gx GOPATH ~/Code/go
set -gx PATH $GOPATH/bin $PATH

# Local path
set -gx PATH ~/.local/bin $PATH

# Ruby gems path
set -gx PATH (ruby -e 'print Gem.user_dir')/bin $PATH
set -gx PATH $HOME/bin $PATH

# nvim instead of vim
alias vim "nvim"
