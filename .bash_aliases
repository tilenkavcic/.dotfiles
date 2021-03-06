#!/bin/bash
# To temporarily bypass an alias, preceed the command with a \
# EG: the ls command is aliased, but to use the normal ls command you would type \ls

# Manage dotfiles in ~/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Makes it so that ctrl+arrows moves the cursor to the end of the current word
bind '"\e[1;5D" backward-word'
bind '"\e[1;5C" forward-word'

# Dark-mode, light-mode
alias darkMode='gsettings set org.gnome.desktop.interface gtk-theme Yaru-dark;
gsettings set org.gnome.desktop.background picture-uri file:///home/tilen/Pictures/wallpapers/dark.jpg'
alias darkmode=darkMode
alias nightMode=darkMode
alias nightmode=darkMode
alias lightMode='gsettings set org.gnome.desktop.interface gtk-theme Yaru-light;
gsettings set org.gnome.desktop.background picture-uri file:///home/tilen/Pictures/wallpapers/light.jpg'
alias lightmode=lightMode
alias dayMode=lightMode
alias daymode=lightMode

# General program aliases
alias mkdir="mkdir -pv"
alias cmd="mcd" # calls function in bash_aliases
alias top="htop"
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -iv'
alias cls='clear'
alias python='python3'
alias chrome='google-chrome --force-dark-mode'
alias open="xdg-open"
# alias _="sudo"
alias q='exit'
# Search files in the current folder
alias f='find . | grep'
alias findrec='find . -name'
# sudo editors
alias svim="sudo vim"
alias snano="sudo nano"

# LS aliases
alias ls='ls -v --color=auto'
alias sl='ls'
alias ll='ls -lhAv'
alias la='ls -Av'
alias l='ls -CFv'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias lsSize="du -cha --max-depth=1 -x . | grep -E \"M|G\" | sort -h"

# CD aliases
alias CD='cd'
alias cd.='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias cd..='cd ..'
alias bd='cd "$OLDPWD"' # CD to previous directory

# Git Commands
alias gcommall='git add -A && git commit -m'
alias gcomm='git commit -m'
alias gpo='git push origin master'
alias gp='git pull'
alias gs='git status'
alias gd='git diff'
alias gr='git reflog'
alias glf='git ls-files'

# General shortcuts
alias update='sudo apt -y update'
alias upgrade='sudo apt -y update && sudo apt -y upgrade && sudo apt autoremove'
alias upgradeq='upgrade && exit'
alias rebootSafe='sudo shutdown -r now'
alias restartSafe=rebootSafe
alias rebootForce='sudo shutdown -r -n now'
alias search='sudo apt search'
alias sola='cd ~/Sola/2.letnik/ && ls'
alias bashrc='code ~/.bashrc && code ~/.bash_aliases'
alias karfjolcaDir='cd ~/Dev/Karfjolca'
alias karfjolcaDev='karfjolcaDir && ghost start && karfjolcaDir && cd content/themes/liebling && code . && cd src && yarn watch'
alias karfjolcaStop='karfjolcaDir && ghost stop && bd'
alias home='cd ~'
alias raspi='ssh pi@192.168.1.18'
alias dev="cd ~/Dev && ls"
alias spotifyDir='cd ~/Dev/Spotify-to-Apple-Music'
alias spotifyDev='spotifyDir && code . && npm install && npm start'
alias domace='sola && cd DN-2-letnik'