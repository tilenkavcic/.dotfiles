function _p4-opened {
  timeout 2.0s p4 opened -s 2> /dev/null
}

function _p4-opened-counts {
  # Return the following counts seperated by tabs:
  #  - count of opened files
  #  - count of pending changesets (other than defaults)
  #  - count of files in the default changeset
  #  - count of opened files in add mode
  #  - count of opened files in edit mode
  #  - count of opened files in delete mode
  _p4-opened | awk '
  BEGIN {
    opened=0;
    type_array["edit"]=0;
    type_array["add"]=0;
    type_array["delete"]=0;
    change_array["change"]=0;
  }
  {
    # p4 opened prints one file per line, and all lines begin with "//"
    # Here is an examples:
    #
    #   $ p4 opened
    #   //depot/some/file.py#4 - edit change 716431 (text)
    #   //depot/another/file.py - edit default change (text)
    #   //now/add/a/newfile.sh -  add change 435645 (text+k)
    #
    #
    if ($1 ~ /^\/\//) {
        opened += 1
        change_array[$5] += 1
        type_array[$3] += 1
    }
  }
  END {
    default_changes=change_array["change"];
    non_default_changes=length(change_array) - 1;
    print opened "\t" non_default_changes "\t" default_changes "\t" type_array["add"] "\t" type_array["edit"] "\t" type_array["delete"]
  }
'
}

# ---------------------------- 

function __ {
  echo "$@"
}

function __make_ansi {
  next=$1; shift
  echo "\[\e[$(__$next $@)m\]"
}

function __make_echo {
  next=$1; shift
  echo "\033[$(__$next $@)m"
}


function __reset {
  next=$1; shift
  out="$(__$next $@)"
  echo "0${out:+;${out}}"
}

function __bold {
  next=$1; shift
  out="$(__$next $@)"
  echo "${out:+${out};}1"
}

function __faint {
  next=$1; shift
  out="$(__$next $@)"
  echo "${out:+${out};}2"
}

function __italic {
  next=$1; shift
  out="$(__$next $@)"
  echo "${out:+${out};}3"
}

function __underline {
  next=$1; shift
  out="$(__$next $@)"
  echo "${out:+${out};}4"
}

function __negative {
  next=$1; shift
  out="$(__$next $@)"
  echo "${out:+${out};}7"
}

function __crossed {
  next=$1; shift
  out="$(__$next $@)"
  echo "${out:+${out};}8"
}


function __color_normal_fg {
  echo "3$1"
}

function __color_normal_bg {
  echo "4$1"
}

function __color_bright_fg {
  echo "9$1"
}

function __color_bright_bg {
  echo "10$1"
}


function __color_black   {
  echo "0"
}

function __color_red   {
  echo "1"
}

function __color_green   {
  echo "2"
}

function __color_yellow  {
  echo "3"
}

function __color_blue  {
  echo "4"
}

function __color_magenta {
  echo "5"
}

function __color_cyan  {
  echo "6"
}

function __color_white   {
  echo "7"
}

function __color_rgb {
  r=$1 && g=$2 && b=$3
  [[ r == g && g == b ]] && echo $(( $r / 11 + 232 )) && return # gray range above 232
  echo "8;5;$(( ($r * 36  + $b * 6 + $g) / 51 + 16 ))"
}

function __color {
  color=$1; shift
  case "$1" in
    fg|bg) side="$1"; shift ;;
    *) side=fg;;
  esac
  case "$1" in
    normal|bright) mode="$1"; shift;;
    *) mode=normal;;
  esac
  [[ $color == "rgb" ]] && rgb="$1 $2 $3"; shift 3

  next=$1; shift
  out="$(__$next $@)"
  echo "$(__color_${mode}_${side} $(__color_${color} $rgb))${out:+;${out}}"
}


function __black   {
  echo "$(__color black $@)"
}

function __red   {
  echo "$(__color red $@)"
}

function __green   {
  echo "$(__color green $@)"
}

function __yellow  {
  echo "$(__color yellow $@)"
}

function __blue  {
  echo "$(__color blue $@)"
}

function __magenta {
  echo "$(__color magenta $@)"
}

function __cyan  {
  echo "$(__color cyan $@)"
}

function __white   {
  echo "$(__color white $@)"
}

function __rgb {
  echo "$(__color rgb $@)"
}


function __color_parse {
  next=$1; shift
  echo "$(__$next $@)"
}

function color {
  echo "$(__color_parse make_ansi $@)"
}

function echo_color {
  echo "$(__color_parse make_echo $@)"
}


black="\[\e[0;30m\]"
red="\[\e[0;31m\]"
green="\[\e[0;32m\]"
yellow="\[\e[0;33m\]"
blue="\[\e[0;34m\]"
purple="\[\e[0;35m\]"
cyan="\[\e[0;36m\]"
white="\[\e[0;37m\]"
orange="\[\e[0;91m\]"

bold_black="\[\e[30;1m\]"
bold_red="\[\e[31;1m\]"
bold_green="\[\e[32;1m\]"
bold_yellow="\[\e[33;1m\]"
bold_blue="\[\e[34;1m\]"
bold_purple="\[\e[35;1m\]"
bold_cyan="\[\e[36;1m\]"
bold_white="\[\e[37;1m\]"
bold_orange="\[\e[91;1m\]"

underline_black="\[\e[30;4m\]"
underline_red="\[\e[31;4m\]"
underline_green="\[\e[32;4m\]"
underline_yellow="\[\e[33;4m\]"
underline_blue="\[\e[34;4m\]"
underline_purple="\[\e[35;4m\]"
underline_cyan="\[\e[36;4m\]"
underline_white="\[\e[37;4m\]"
underline_orange="\[\e[91;4m\]"

background_black="\[\e[40m\]"
background_red="\[\e[41m\]"
background_green="\[\e[42m\]"
background_yellow="\[\e[43m\]"
background_blue="\[\e[44m\]"
background_purple="\[\e[45m\]"
background_cyan="\[\e[46m\]"
background_white="\[\e[47;1m\]"
background_orange="\[\e[101m\]"

normal="\[\e[0m\]"
reset_color="\[\e[39m\]"

# These colors are meant to be used with `echo -e`
echo_black="\033[0;30m"
echo_red="\033[0;31m"
echo_green="\033[0;32m"
echo_yellow="\033[0;33m"
echo_blue="\033[0;34m"
echo_purple="\033[0;35m"
echo_cyan="\033[0;36m"
echo_white="\033[0;37;1m"
echo_orange="\033[0;91m"

echo_bold_black="\033[30;1m"
echo_bold_red="\033[31;1m"
echo_bold_green="\033[32;1m"
echo_bold_yellow="\033[33;1m"
echo_bold_blue="\033[34;1m"
echo_bold_purple="\033[35;1m"
echo_bold_cyan="\033[36;1m"
echo_bold_white="\033[37;1m"
echo_bold_orange="\033[91;1m"

echo_underline_black="\033[30;4m"
echo_underline_red="\033[31;4m"
echo_underline_green="\033[32;4m"
echo_underline_yellow="\033[33;4m"
echo_underline_blue="\033[34;4m"
echo_underline_purple="\033[35;4m"
echo_underline_cyan="\033[36;4m"
echo_underline_white="\033[37;4m"
echo_underline_orange="\033[91;4m"

echo_background_black="\033[40m"
echo_background_red="\033[41m"
echo_background_green="\033[42m"
echo_background_yellow="\033[43m"
echo_background_blue="\033[44m"
echo_background_purple="\033[45m"
echo_background_cyan="\033[46m"
echo_background_white="\033[47;1m"
echo_background_orange="\033[101m"

echo_normal="\033[0m"
echo_reset_color="\033[39m"


# -------------------------------

SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX=" ${green}|"
SCM_THEME_PROMPT_SUFFIX="${green}|"

GIT_THEME_PROMPT_DIRTY=" ${red}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓"
GIT_THEME_PROMPT_PREFIX=" ${green}|"
GIT_THEME_PROMPT_SUFFIX="${green}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

__bobby_clock() {
  printf "$(clock_prompt) "

  if [ "${THEME_SHOW_CLOCK_CHAR}" == "true" ]; then
    printf "$(clock_char) "
  fi
}

THEME_SHOW_CLOCK_CHAR=${THEME_SHOW_CLOCK_CHAR:-"true"}
THEME_CLOCK_CHAR_COLOR=${THEME_CLOCK_CHAR_COLOR:-"$red"}
THEME_CLOCK_COLOR=${THEME_CLOCK_COLOR:-"$bold_cyan"}
THEME_CLOCK_FORMAT=${THEME_CLOCK_FORMAT:-"%Y-%m-%d %H:%M:%S"}