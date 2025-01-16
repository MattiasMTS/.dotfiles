{ pkgs, ... }:
{
  enable = true;

  aggressiveResize = true;
  baseIndex = 1;
  escapeTime = 0;
  disableConfirmationPrompt = true;
  keyMode = "vi";
  shell = "${pkgs.zsh}/bin/zsh";
  shortcut = "a";
  terminal = "screen-256color";
  newSession = true;
  secureSocket = true;

  plugins = with pkgs.tmuxPlugins; [
    # sensible # buggy, see https://github.com/nix-community/home-manager/issues/5952
    {
      plugin = resurrect;
      extraConfig = ''
        set -g @resurrect-capture-pane-contents 'on'
        set -g @resurrect-strategy-nvim 'session'
      '';
    }
    {
      plugin = yank;
      extraConfig = ''
        set -g @yank_action 'copy-pipe' # instead of copy-pipe-cancel, to not jump to bottom
      '';
    }

  ];
  extraConfig = ''
    set -g history-limit 100000

    # modern colors
    # set -g default-terminal 'tmux-256color'
    # set -g terminal-overrides "*256col*:Tc"

    # Undercurl
    set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
    set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0

    # For image.nvim
    set -gq allow-passthrough on
    set -g visual-activity off

    # macos style
    set -g status-position top
    set -g status-justify "left"

    # use system clipboard
    set -g set-clipboard on

    # split windows remap
    unbind %
    bind _ split-window -h -c "#{pane_current_path}"
    unbind '"'
    bind - split-window -v -c "#{pane_current_path}"

    # window management
    bind Tab last-window
    bind-key x kill-pane # skip "kill-pane 1? (y/n)" prompt (cmd+w)
    bind-key s choose-tree -Z -s

    # count from 1 instead of 0 for easier jumping etc
    set-window-option -g pane-base-index 1
    set-option -g renumber-windows on

    # enable mouse
    set -g mouse on
    unbind -T copy-mode-vi MouseDragEnd1Pane

    # transparent background line
    set -g pane-active-border-style 'fg=magenta,bg=default'
    set -g pane-border-style 'fg=brightblack,bg=default'
    set -g status-style 'bg=default'
    set -g status-interval 5

    # Left status
    set -g status-left-length 50
    set -g status-left '#[fg=blue,bold]#S #[fg=white,nobold]'

    # Window status
    setw -g window-status-format '#[fg=brightblack]#I:#W'
    setw -g window-status-current-format '#{?window_zoomed_flag,#[fg=yellow][Z],#[fg=magenta,bold]}#I:#W'

    # Right status - just time and date
    set -g status-right-length 50
    set -g status-right '#[fg=white]%H:%M #[fg=brightblack]%Y-%m-%d'

    # Following are some recommended settings for Neovim. See ":checkhealth" for more information
    set-option -sg escape-time 5
    set-option -g focus-events on
    set -g detach-on-destroy off

    # keybindings
    bind-key -T copy-mode-vi 'v' send-keys -X begin-selection
    bind-key -T copy-mode-vi 'y' send-keys -X copy-selection-and-cancel
    bind-key -T copy-mode-vi 'C-v' send-keys -X rectangle-toggle

    # '@pane-is-vim' is a pane-local option that is set by the plugin on load,
    # and unset when Neovim exits or suspends; note that this means you'll probably
    # not want to lazy-load smart-splits.nvim, as the variable won't be set until
    # the plugin is loaded

    # Smart pane switching with awareness of Neovim splits.
    bind-key -n C-h if -F "#{@pane-is-vim}" 'send-keys C-h'  'select-pane -L'
    bind-key -n C-j if -F "#{@pane-is-vim}" 'send-keys C-j'  'select-pane -D'
    bind-key -n C-k if -F "#{@pane-is-vim}" 'send-keys C-k'  'select-pane -U'
    bind-key -n C-l if -F "#{@pane-is-vim}" 'send-keys C-l'  'select-pane -R'

    # Smart pane resizing with awareness of Neovim splits.
    bind-key -n M-h if -F "#{@pane-is-vim}" 'send-keys M-h' 'resize-pane -L 3'
    bind-key -n M-j if -F "#{@pane-is-vim}" 'send-keys M-j' 'resize-pane -D 3'
    bind-key -n M-k if -F "#{@pane-is-vim}" 'send-keys M-k' 'resize-pane -U 3'
    bind-key -n M-l if -F "#{@pane-is-vim}" 'send-keys M-l' 'resize-pane -R 3'

    tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
    if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
        "bind-key -n 'C-\\' if -F \"#{@pane-is-vim}\" 'send-keys C-\\\\'  'select-pane -l'"

    bind-key -T copy-mode-vi 'C-h' select-pane -L
    bind-key -T copy-mode-vi 'C-j' select-pane -D
    bind-key -T copy-mode-vi 'C-k' select-pane -U
    bind-key -T copy-mode-vi 'C-l' select-pane -R
    bind-key -T copy-mode-vi 'C-\' select-pane -l

    # bind 'f' display-popup -E "tms"
    # bind 'j' display-popup -E "tms switch"

    # tmux sessionizer
    bind-key "f" run-shell "sesh connect \"$(
      sesh list --icons | fzf-tmux -p 80%,70% \
        --no-sort --ansi --border-label ' sesh ' --prompt '⚡  ' \
        --header '  ^a all ^t tmux ^g configs ^x zoxide ^d tmux kill ^f find' \
        --bind 'tab:down,btab:up' \
        --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list --icons)' \
        --bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -t --icons)' \
        --bind 'ctrl-g:change-prompt(⚙️  )+reload(sesh list -c --icons)' \
        --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z --icons)' \
        --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
        --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)' \
        --preview-window 'right:55%' \
        --preview 'sesh preview {}'
    )\""

    bind -N "last-session (via sesh) " p run-shell "sesh last"

    # window activity notification
    setw -g monitor-activity on
  '';
}

