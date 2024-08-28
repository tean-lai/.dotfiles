# Lines configured by zsh-newuser-install
HISTSIZE=1000
SAVEHIST=1000
# setopt autocd extendedglob nomatch

export EDITOR=nvim
export VISUAL=nvim

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

# eval "$(starship init zsh)"
export PATH=".config/emacs/bin:$PATH"



function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
      builtin cd -- "$cwd"
    fi
  rm -f -- "$tmp"
}

# export DVTM_TERM="alacritty dvtm"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/tean/.conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/tean/.conda/etc/profile.d/conda.sh" ]; then
        . "/Users/tean/.conda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/tean/.conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

