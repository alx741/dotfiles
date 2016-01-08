#{{{ Zgen
    source "${HOME}/.zsh/zgen/zgen.zsh"

    if ! zgen saved
    then
        echo "Creating a zgen save"

        zgen load zsh-users/zsh-syntax-highlighting
        zgen load zsh-users/zsh-history-substring-search
        zgen load radhermit/gentoo-zsh-completions src

        zgen save
    fi
#}}}

#{{{ ZSH Modules
    autoload -U compinit promptinit zcalc zsh-mime-setup
    autoload -U colors && colors
    autoload -Uz vcs_info
    compinit
    promptinit
    zsh-mime-setup
#}}}

#{{{ Options
    # See `man zshoptions`

    setopt AUTO_PUSHD
    setopt CORRECT
    setopt GLOB_COMPLETE
    setopt RM_STAR_WAIT
    setopt ZLE
    setopt VI
    setopt NO_HUP
    setopt IGNORE_EOF
    setopt NO_BEEP
    setopt NUMERIC_GLOB_SORT
    setopt EXTENDED_GLOB
    setopt RC_EXPAND_PARAM
    setopt APPEND_HISTORY
    setopt  COMPLETE_IN_WORD
    setopt prompt_subst
    setopt nohashdirs
    setopt nohashcmds
    unsetopt FLOW_CONTROL
    unsetopt LIST_AMBIGUOUS

    # History options
    setopt EXTENDED_HISTORY
    setopt SHARE_HISTORY
    setopt HIST_IGNORE_DUPS
    setopt HIST_IGNORE_ALL_DUPS
    setopt HIST_REDUCE_BLANKS
    setopt HIST_IGNORE_SPACE
    setopt HIST_NO_STORE
    setopt HIST_VERIFY
    setopt HIST_SAVE_NO_DUPS
    setopt HIST_EXPIRE_DUPS_FIRST
    setopt HIST_FIND_NO_DUPS
#}}}

#{{{ Variables
    export HADES="hades.alx.mooo.com"
    export SCRIPTS="~/.scripts"
    export EDITOR=nvim
    export PAGER=less
    export KEYTIMEOUT=1  # Reduce vi-mode lag
    export ANDROID_HOME="/opt/android-sdk-update-manager"
    export ANDROID_SWT="/usr/share/swt-3.7/lib"
    export ANDROID_TOOLS="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"

    # Java
    export _JAVA_AWT_WM_NONREPARENTING=1
    export CLASSPATH="${CLASSPATH}:.:$(java-config -p tomcat-7,tomcat-servlet-api-3.1)"
    export CLASSPATH="${CLASSPATH}:.:$(java-config -p myfaces-api)"
    export CLASSPATH="${CLASSPATH}:/usr/share/primefaces/lib/primefaces-5.3.jar"
    export JAVA_HOME="$(java-config -O)"

    # Gradle
    export GRADLE_HOME="/opt/gradle-2.9"

    # Path
    PATH="/bin:/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:"
    PATH+="$ANDROID_TOOLS:"
    PATH+="$JAVA_HOME/bin:"
    PATH+="$GRADLE_HOME/bin:"
    export PATH
    declare -U path

    # History
    HISTFILE=~/.history
    SAVEHIST=1000
    HISTSIZE=1000
#}}}

#{{{ Aliases
    alias am="alsamixer" alsamixer='alsamixer -g -c 0'
    alias auto="$EDITOR configure.ac Makefile.am config.h.in"
    alias clip="xclip -selection clipboard -i"
    alias dot="dot -Tpng -O"
    alias eje="sudo eject /mnt/mem"
    alias ga="git add"
    alias git="hub"
    alias gl="git log"
    alias grep="grep --color=auto"
    alias gs="git status"
    alias l="ls -l"
    alias ls="ls --color"
    alias m="mplayer"
    alias mem="sudo mount /dev/sdb1 /mnt/mem"
    alias mysql="mysql -u $USER -p --sigint-ignore"
    alias p="ping 8.8.8.8"
    alias s="sudo"
    alias suod="sudo"
    alias tte="trans -b -t en"
    alias tts="trans -b -t es"
    alias dhcp="sudo dhclient enp3s0"
    alias v="/usr/bin/nvim"
    alias vi="/usr/bin/nvim"
    alias vim="nvim"
    alias x="startx"
    alias z="zathura"

    #{{{ Scripts
        alias addio="$SCRIPTS/fancy/addio.sh halt"
        alias eT="$SCRIPTS/network/et_phone_home.sh"
        alias gp="$SCRIPTS/fancy/git_push.sh"
        alias labip="$SCRIPTS/network/echo_lab_ip.sh"
        alias md="$SCRIPTS/md.sh"
        alias poweroff="$SCRIPTS/fancy/addio.sh halt"
        alias pro="$SCRIPTS/configure_projector.sh"
        alias pubip="$SCRIPTS/network/echo_pub_ip.sh"
        alias reboot="$SCRIPTS/fancy/addio.sh reboot"
        alias rr="$SCRIPTS/ratpoison/restore_ratpoison.sh"
        alias ymd="$SCRIPTS/youtube_music_download.sh"
        alias yt="$SCRIPTS/youtube_mplayer.sh"
    #}}}

    #{{{ Sufix
        alias -s md=md
        alias -s c=vim
        alias -s cpp=vim
        alias -s h=vim
        alias -s hpp=vim
        alias -s java=vim
        alias -s py=vim
        alias -s php=vim
        alias -s html=vim
        alias -s css=vim
        alias -s js=vim
        alias -s pdf=zathura
        alias -s jpg=sxiv
        alias -s png=sxiv
    #}}}

    #{{{ Edit Dotfiles
        alias ev="$EDITOR ~/.config/nvim/init.vim"
        alias et="$EDITOR ~/.tmux.conf"
        alias er="$EDITOR ~/.ratpoisonrc"
        alias ez="$EDITOR ~/.zshrc"
        alias ex="$EDITOR ~/.xinitrc"
    #}}}

    #{{{ Fast directory access
        alias ..='cd ..'
        alias ...='cd ../..'
        alias ....='cd ../../..'
        alias ,,='cd .. && ls -l'
        alias ,,,='cd ../.. && ls -l'
        alias ,,,,='cd ../../.. && ls -l'
        alias dot="cd ~/lab/dotfiles/"
        alias opta="cd ~/u/optativa/2/"
        alias ope="cd ~/u/operativos/2/"
        alias web="cd ~/u/progra/web/"
        alias bd="cd ~/u/bases_datos/2/"
        alias inv="cd ~/u/invest_operaciones/"
        alias silly="cd ~/lab/silly-bytes/"
    #}}}
#}}}

#{{{ Completion
    zstyle ':completion::complete:*' use-cache 1
    zstyle ':completion:*' accept-exact '*(N)'
    zstyle ':completion:*' use-cache on
    zstyle ':completion:*' cache-path ~/.zsh/cache
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
    zstyle ':completion:*' verbose yes
    zstyle ':completion:*:descriptions' format '%B%d%b'
    zstyle ':completion:*:messages' format '%d'
    zstyle ':completion:*' group-name ''
    zstyle ':completion:*' auto-description 'specify: %d'
    zstyle ':completion:*:default' list-prompt '%S%M matches%s'
    zstyle ':completion:*:default' menu 'select=0'
    zstyle ':completion:*' file-sort modification reverse
    zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"
    zstyle ':completion:*:manuals' separate-sections true
    zstyle ':completion:*:corrections' format '%B%d (errors %e)%b'
    zstyle ':completion::*:(rm|vi):*' ignore-line true
    zstyle ':completion:*' ignore-parents parent pwd
    zstyle ':completion::approximate*:*' prefix-needed false

    #{{{ Ignore
        zstyle ':completion:*:(all-|)files' ignored-patterns "(*.pyc|*~|*.o|*.class)"
        zstyle ':completion:*:ls:*:(all-|)files' ignored-patterns
        zstyle ':completion:*:rm:*:(all-|)files' ignored-patterns
    #}}}
#}}}

#{{{ Key bindings
    # Special keys works properly

    bindkey '\e[1~' beginning-of-line
    bindkey '\e[4~' end-of-line
    bindkey '\e[A' up-line-or-history
    bindkey '\e[B' down-line-or-history
    bindkey '\eOA' up-line-or-history
    bindkey '\eOB' down-line-or-history
    bindkey '\e[C' forward-char
    bindkey '\e[D' backward-char
    bindkey '\eOC' forward-char
    bindkey '\eOD' backward-char
#}}}

#{{{ Prompt
    zstyle ':vcs_info:*' stagedstr '%F{28}^'
    zstyle ':vcs_info:*' unstagedstr '%F{11}^'
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
    zstyle ':vcs_info:*' enable git svn

    precmd()
    {
        if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
            zstyle ':vcs_info:*' formats ' [%F{green}%b%c%u%F{normal}]'
        } else {
            zstyle ':vcs_info:*' formats ' [%F{green}%b%c%u%F{red}^%F{normal}]'
        }

        vcs_info
    }

    PROMPT='%{$fg[blue]%}%B%n%b%{$reset_color%}@%{$fg[magenta]%}%B%M%b%'
    PROMPT+='{$reset_color%} %1~ ${vcs_info_msg_0_}%{$reset_color%}%# '
#}}}

#{{{ Vi-mode
    # From `oh-my-zsh` vi-mode plugin

    # Ensures that $terminfo values are valid and updates editor information
    # when the keymap changes.
    function zle-keymap-select zle-line-init zle-line-finish {
      # The terminal must be in application mode when ZLE is active for
      # $terminfo values to be valid.
      if (( ${+terminfo[smkx]} )); then
        printf '%s' ${terminfo[smkx]}
      fi
      if (( ${+terminfo[rmkx]} )); then
        printf '%s' ${terminfo[rmkx]}
      fi

      zle reset-prompt
      zle -R
    }

    # Ensure that the prompt is redrawn when the terminal size changes.
    TRAPWINCH() {
      if [[ -o zle ]]; then
        zle reset-prompt
        zle -R
      fi
    }

    zle -N zle-line-init
    zle -N zle-line-finish
    zle -N zle-keymap-select
    zle -N edit-command-line


    bindkey -v

    # Avoid dropping keystrokes after ESC hit
    bindkey -as '\e' ''

    # allow ctrl-p, ctrl-n, ctrl-r for navigate history (standard behaviour)
    bindkey '^P' up-history
    bindkey '^N' down-history
    bindkey '^r' history-incremental-search-backward

    # Incrementar search for / and ?
    bindkey -M vicmd "/" history-incremental-search-backward
    bindkey -M vicmd "?" history-incremental-search-forward

    # allow ctrl-h, ctrl-w, ctrl-? for char and word deletion
    # (standard behaviour)
    bindkey '^?' backward-delete-char
    bindkey '^h' backward-delete-char
    bindkey '^w' backward-kill-word

    # Some extra vim like bindings
    bindkey -a 'gg' beginning-of-buffer-or-history
    bindkey -a 'G' end-of-buffer-or-history
    bindkey -a 'u' undo
    bindkey -a '^R' redo

    # Mode indicator right prompt
    function zle-line-init zle-keymap-select
    {
        RPS1="${${KEYMAP/vicmd/}/(main|viins)/-- INSERT --}"
        RPS2=$RPS1
        zle reset-prompt
    }

    # Allow Copy/Paste with the system clipboard
    # behave as expected with vim commands ( y/p/d/c/s )
    [[ -n $DISPLAY ]] && (( $+commands[xclip] )) && {

      function cutbuffer() {
        zle .$WIDGET
        echo $CUTBUFFER | xclip -selection clipboard
      }

      zle_cut_widgets=(
        vi-yank
        vi-yank-eol
      )
      for widget in $zle_cut_widgets
      do
        zle -N $widget cutbuffer
      done

      function putbuffer() {
        zle copy-region-as-kill "$(xclip -selection clipboard -o)"
        zle .$WIDGET
      }

      zle_put_widgets=(
        vi-put-after
        vi-put-before
      )
      for widget in $zle_put_widgets
      do
        zle -N $widget putbuffer
      done
    }
#}}}

#{{{ Misc
    # Deactivate Software flow control
    stty -ixon

    # Set proper terminal for SCREEN and TMUX
    if [[ -z $TMUX ]]; then
        if [ -e /usr/share/terminfo/x/xterm+256color ]; then
            export TERM='xterm-256color'
        else
            export TERM='xterm'
        fi
    else
        if [ -e /usr/share/terminfo/s/screen-256color ]; then
            export TERM='screen-256color'
        else
            export TERM='screen'
        fi
    fi

    # Take me home to the place I belong, take me home, country roads...
    if [[ `pwd` == "/" ]]
    then
        cd ~
    fi
#}}}

#{{{ Plugins configuration
    #{{{ history-substring-search
        bindkey -M vicmd 'k' history-substring-search-up
        bindkey -M vicmd 'j' history-substring-search-down
    #}}}
#}}}

#{{{ First Init
    # Auto start X11
    if [[ ! (-e /tmp/.X0-lock) ]]; then
        startx
    fi
#}}}


# vim:fdm=marker
