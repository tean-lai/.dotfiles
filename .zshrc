HISTSIZE=1000
SAVEHIST=1000

export EDITOR=vim
export VISUAL=vim

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

# if command -v starship &> /dev/null; then
#   eval "$(starship init zsh)"
# fi

# opam configuration
test -r "$HOME/.opam/opam-init/init.sh" && . "$HOME/.opam/opam-init/init.sh" > /dev/null 2> /dev/null || true

export OCAMLRUNPARAM=b

# . "$HOME/.local/bin/env"
alias p=python3
alias pp=pypy3
alias v=vim
alias c=cat

# TODO: remove this after being done with CS 4414
# alias rv='docker run -i --rm -v "$PWD":/root ghcr.io/shouxulin/cs4414hw1'

# . "$HOME/.local/bin/env"
# export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
# export PATH="/opt/nvim-linux-x86_64/bin:$PATH"


