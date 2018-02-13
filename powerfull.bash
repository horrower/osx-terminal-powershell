export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced



if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi




gpr() {
# LC_ALL=en_US.UTF-8
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/' `
     git push --set-upstream origin $BRANCH
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

parse_git_not_changed() {
    if [ `echo -n "$1" 2> /dev/null | grep "nothing to commit, working tree clean" &> /dev/null; echo "$?" | bc ` == 0 ] ; then
        true
    elif [ $SHOW_UNTRACKED_AS_DIRTY == 0 ] && [ `echo -n "$1" 2> /dev/null | grep "nothing added to commit but untracked files present" &> /dev/null; echo "$?" | bc ` == 0 ] ; then
        true
    else
        false
    fi
}

parse_git_dirty() {
    ahead=`echo -n "$1" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    behind=`echo -n "$1" 2> /dev/null | grep "Your branch is behind" &> /dev/null; echo "$?"`
    aheadandbehind=`echo -n "$1" 2> /dev/null | grep "different commits each" &> /dev/null; echo "$?"`
    
    bits=''
    if [ "${aheadandbehind}" == "0" ]; then
	bits="⇵${bits}"
    elif [ "${behind}" == "0" ]; then
	bits="↓${bits}"
    elif [ "${ahead}" == "0" ]; then
	bits="↑${bits}"
    fi
    if [ ! "${bits}" == "" ]; then
	echo "${bits}"
    else
	echo " "
    fi
}

git_color_by_status() {
  if parse_git_not_changed "$1"; then
    echo -e $COLOR_BLUE
  else
    echo -e $COLOR_ORANGE
  fi
}




# color builder http://terminal-color-builder.mudasobwa.ru/

COLOR_BLUE="\033[0;38;05;232;48;05;147m"
COLOR_RESET="\033[0m"
COLOR_ORANGE="\033[0;38;05;232;48;05;181m"
COLOR_WHITE="\033[38;05;15m"
COLOR_GRAY="\033[38;05;253;48;05;242m"
COLOR_GRAY_BG_WHITE="\033[38;05;15;48;05;242m"
COLOR_GRAY_BLACK="\033[38;05;252;48;05;232m"
SHOW_UNTRACKED_AS_DIRTY=0



# powerline shell inputs  13:51:41  DraK
# need to install font Monaco Powerline MacOS https://gist.github.com/baopham/1838072
#  master ↓31 {95} U:1  /www/project1/public 
# export PS1="\[\033[01;38;5;249m\][\[\033[01;38;5;52m\]d\[\033[01;38;5;196m\]r\033[01;38;5;208m\]a\[\033[01;38;5;196m\]k\[\033[01;38;5;249m\]] \W\[\033[01;38;5;172m\]\$
git_ps1() {
    inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
    if [ "$inside_git_repo" ]; then
	status="$(git status 2> /dev/null)"
	echo -e "$(git_color_by_status "$status")  $(parse_git_branch) $(parse_git_dirty "$status") $COLOR_GRAY_BG_WHITE"""
    else
	echo -e "$COLOR_GRAY# "
    fi
}
LPS=git_ps1
export PS1="\$(git_ps1) \[$COLOR_GRAY\]\W \[$COLOR_GRAY_BLACK\]\[$COLOR_RESET\] "


