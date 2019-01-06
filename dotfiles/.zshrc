export TERM="xterm-256color"



################ FUNCTIONS FOR AUTO-RENAMING TITLES ################################# [OMZ]


function title {
  emulate -L zsh
  setopt prompt_subst

  [[ "$EMACS" == *term* ]] && return

  # if $2 is unset use $1 as default
  # if it is set and empty, leave it as is
  : ${2=$1}

  case "$TERM" in
    cygwin|xterm*|putty*|rxvt*|ansi)
      print -Pn "\e]2;$2:q\a" # set window name
      print -Pn "\e]1;$1:q\a" # set tab name
      ;;
    screen*)
      print -Pn "\ek$1:q\e\\" # set screen hardstatus
      ;;
    *)
      if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
        print -Pn "\e]2;$2:q\a" # set window name
        print -Pn "\e]1;$1:q\a" # set tab name
      else
        # Try to use terminfo to set the title
        # If the feature is available set title
        if [[ -n "$terminfo[fsl]" ]] && [[ -n "$terminfo[tsl]" ]]; then
	  echoti tsl
	  print -Pn "$1"
	  echoti fsl
	fi
      fi
      ;;
  esac
}


# Runs before showing the prompt
function omz_termsupport_precmd {
  emulate -L zsh

  if [[ "$DISABLE_AUTO_TITLE" == true ]]; then
    return
  fi

  title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE
}


function omz_termsupport_preexec {
  emulate -L zsh
  setopt extended_glob

  if [[ "$DISABLE_AUTO_TITLE" == true ]]; then
    return
  fi

  # cmd name only, or if this is sudo or ssh, the next cmd
  local CMD=${1[(wr)^(*=*|sudo|ssh|mosh|rake|-*)]:gs/%/%%}
  local LINE="${2:gs/%/%%}"

  title '$CMD' '%100>...>$LINE%<<'
}

precmd_functions+=(omz_termsupport_precmd)
preexec_functions+=(omz_termsupport_preexec)

################ END ########################################################### [OMZ]


zstyle ':completion:*:*:git:*' script /usr/local/etc/bash_completion.d/git-completion.bash
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit && compinit
zmodload -i zsh/complist
zstyle ':completion:*' menu select

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=100000
# End of lines configured by zsh-newuser-install

bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word


source ~/.myzshrc

source ~/.myzsh_aliases

source ~/.myzsh_funcs
####    ZPLUG    ######
source ~/.zplugrc


source ~/.myzshrc.after
# ctf-tools: gem install
#export PATH=$PATH:/home/kunal/.gem/ruby/2.5.0/bin
