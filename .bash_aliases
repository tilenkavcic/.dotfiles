# To temporarily bypass an alias, we preceed the command with a \
# EG: the ls command is aliased, but to use the normal ls command you would type \ls
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Dark-mode, light-mode
alias darkMode='gsettings set org.gnome.desktop.interface gtk-theme Yaru-dark;
gsettings set org.gnome.desktop.background picture-uri file:///home/tilen/Pictures/wallpapers/dark.jpg'
alias dark-mode=darkMode
alias darkmode=darkMode
alias night-mode=darkMode
alias nightmode=darkMode
alias lightMode='gsettings set org.gnome.desktop.interface gtk-theme Yaru;
gsettings set org.gnome.desktop.background picture-uri file:///home/tilen/Pictures/wallpapers/light.jpg'
alias light-mode=lightMode
alias day-mode=lightMode
alias lightmode=lightMode
alias daymode=lightMode

# Shortcuts
alias updatej='sudo apt -y update; sudo apt -y upgrade'
alias update='sudo apt -y update'
alias upgrade='sudo apt -y update && sudo apt -y upgrade && sudo apt autoremove'
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'
alias search='sudo apt search'
alias sola='cd ~/Sola/2.letnik/ && ls'
alias bashrc='code ~/.bashrc'
alias karfjolca='cd ~/Dev/Karfjolca && code .'
# Search files in the current folder
alias f='find . | grep'

# LS aliases
alias sl='ls'
alias ll='ls -lhA'
alias la='ls -A'
alias l='ls -CF'

# CD aliases
alias CD='cd'
alias cd.='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias cd..='cd ..'
# Goes up a specified number of directories  (i.e. $ up 4)
up () {
    local d=""
    limit=$1
    for ((i=1 ; i <= limit ; i++))
    do
        d=$d/..
    done
    d=$(echo $d | sed 's/^\///')
    if [ -z "$d" ]; then
        d=..
    fi
    cd $d
}
#cd to previous directory
alias bd='cd "$OLDPWD"'

alias mkdir="mkdir -pv"
alias top="htop"
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -iv'
alias cls='clear'
alias python='python3'
alias _="sudo"
alias q='exit'
# sudo editors
alias svim="sudo vim"
alias snano="sudo nano"

# ctrl+arrows goes to the end of the word
bind '"\e[1;5D" backward-word'
bind '"\e[1;5C" forward-word'

# Git Commands, Add and Commit are used as functions
alias gcommall='git add -A && git commit -m'
alias gcomm='git commit -m'
alias gpo='git push origin master'
alias gp='git pull'
alias gs='git status'
alias gd='git diff'
alias gr='git reflog'
alias glf='git ls-files'