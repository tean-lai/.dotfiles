HISTSIZE=1000
SAVEHIST=1000

export EDITOR=nvim
export VISUAL=nvim

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
alias v=nvim
alias c=cat

# . "$HOME/.local/bin/env"
# export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"  # needed for homebrew to find javac
# export PATH="/opt/nvim-linux-x86_64/bin:$PATH"

# eval "$($HOME/homebrew/bin/brew shellenv)"

# this is for zsh completions? hopefully
autoload -Uz compinit
compinit
