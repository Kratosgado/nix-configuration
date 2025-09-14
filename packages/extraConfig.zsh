typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
        cd)                 fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
        export|unset)       fzf --preview "eval 'echo \$' {}" "$@" ;;
        ssh)                fzf --preview 'dig {}' "$@" ;;
        *)                  fzf --preview 'bat -n --color=always --line-range :500 {}' "$@" ;;
    esac
}

export PNPM_HOME="/root/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

eval "$(zoxide init zsh)"
eval "$(devbox global shellenv --init-hook)"
eval "$(pay-respects zsh)"
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
