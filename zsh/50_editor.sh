# Editing

if [[ -z "$SSH_TTY" && "$OSTYPE" =~ ^darwin ]]; then
  export EDITOR='subl -w'
  export LESSEDIT='subl -w %f'
  alias e='subl'
else
  export EDITOR=$(type nano pico vi vim 2>/dev/null | sed 's/ .*$//;q')
  alias e="$EDITOR -w -z"
fi

export VISUAL="$EDITOR"

alias e.='e .'
