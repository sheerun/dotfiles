new-session

set-option -g prefix `
bind-key ` send-prefix

set -g status-utf8 on
set-option -g mouse-select-pane on
set-option -g mouse-select-window on
set-option -g mouse-resize-pane on
set-option -g mouse-utf8 on
set-window-option -g mode-mouse on

set -g default-terminal "screen-256color"

bind r source-file ~/.tmux.conf

bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5

setw -g mode-keys vi
