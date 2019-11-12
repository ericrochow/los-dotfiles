#============================================================
#
#  ALIASES AND FUNCTIONS
#
#  Arguably, some functions defined here are quite big.
#  If you want to make this file smaller, these functions can
#+ be converted into scripts and removed from here.
#
#============================================================

#-------------------
# Personnal Aliases
#-------------------

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'
alias ...='cd ../..'

# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'


alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------
# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls --color=auto'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -alF --group-directories-first --color=auto"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#-------------------------------------------------------------
# Force SSH sessions to use chromaterm-- (if installed)
#-------------------------------------------------------------
sshc() {
  TERM=xterm
  if hash ct 2>/dev/null; then
    /usr/bin/ssh $* | ct
  else
    /usr/bin/ssh $*
  fi
}
# alias ssh='sshc'

#--------------------------------------------------------------
# Python stuff
#--------------------------------------------------------------
alias venv2='virtualenv --python=python2 env'
alias venv3='virtualenv --python=python3 env'

#--------------------------------------------------------------
# Route servers
#--------------------------------------------------------------
alias route-views='telnet route-views.routeviews.org'
alias att='telnet route-server.ip.att.net'
alias comcast='telnet route-server.newyork.ny.ibone.comcast.net'
alias he='telnet route-server.he.net'

#--------------------------------------------------------------
#erochow originals
#--------------------------------------------------------------
alias tmuxre='tmux -2 attach-session -d -t de || /usr/bin/tmux_config'
alias tmuxprog='tmux -2 attach-session -d -t prog || tmux new-session -s prog'
alias tmuxhw='tmux -2 attach-session -d -t hollywood || tmux new-session -s hollywood "/usr/bin/hollywood"'
alias tmuxlab='tmux attach-session -d -t lab || tmux new-session -s lab'
alias whoisas='whois -h whois.cymru.com -v'
alias forecast='curl -so /tmp/weather http://wttr.in ; cat /tmp/weather | egrep -e "City:|Feature:|@igor" -v'
alias chromium-browser='/usr/lib/chromium-browser/chromium-browser --enable-plugins %U'
alias updates='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo aideinit -f -y -b'
alias bogons='whois -h whois.radb.net fltr-bogons'

#-------------------------------------------------------------
# wks-specific aliases
#-------------------------------------------------------------
case $(hostname) in
  "thiccboi")
    alias vpslogin='ssh -i ~/.ssh/host.beardofprey.net.key erochow@lwvps.ericrochow.net'
    alias orwell-rsync='rsync -avz -e "ssh -p 29070 -i /home/erochow/.ssh/host.beardofprey.net.key.pub"'
    alias ine-rsync='rsync -avzru -e "ssh -p 29070 -i /home/erochow/.ssh/host.beardofprey.net.key.pub" ~/Videos/ erochow@www.ericrochow.net:/media/Media/Video/Puters/'
    alias sdnify='/home/erochow/Scripts/sdnify/env/bin/python /home/erochow/Scripts/sdnify/sdnify.py'
    alias unicorndust='/home/erochow/Scripts/sdnify/env/bin/python /home/erochow/Scripts/sdnify/unicorndust.py'
    alias clippypost='/home/erochow/Scripts/sdnify/env/bin/python /home/erochow/Scripts/sdnify/clippypost.py'
    alias nocpasswd='ssh oldnoc "sudo cat /home/passwords/newpasswords8-now_in_use_now"'
    alias nocpasswd7='ssh oldnoc "sudo cat /home/passwords/oldpasswords7"'
    alias autopw='ssh oldnoc "sudo grep automation /home/passwords/newpasswords8-now_in_use_now " | awk '"'"'{print $2}'"'"''
    alias autopw7='ssh oldnoc "sudo grep automation /home/passwords/oldpasswords7" | awk '"'"'{print $2}'"'"''
    alias autossh='sshpass -p $(autopw) ssh -l automation -o StrictHostKeyChecking=no'
    alias autossh7='sshpass -p $(autopw7) ssh -l automation -o StrictHostKeyChecking=no'
    alias orwell='ssh -4 www.ericrochow.net -p 29070'
    alias asimov='ssh -4 www.ericrochow.net -p 29071'
    alias clippy='sudo lxc exec bots.noc:clippy bash'
    alias salesforce='sudo lxc exec bots.noc:salesforce bash'
    alias kpcli='kpcli --kdb /opt/keepass/erochow.kdbx'
    alias lab='telnet lab.noc.liquidweb.com'
    alias eqx1='ssh lw-eqx-border1.rtr'
    alias eqx2='ssh lw-eqx-border2.rtr'
    alias ash1='ssh lw-ash-border1.rtr'
    alias ash2='ssh lw-ash-border2.rtr'
    ;;
  "lilshawty")
    ;;
  *)
    ;;
esac


#-------------------------------------------------------------
# dig aliases and functions
#-------------------------------------------------------------
alias digx='dig +short -x'
alias diga='dig +short'
digg() {
  DOMAIN="$(dig +short -x $1)"
  echo -e "Domain:\t$DOMAIN"
  IP="$(dig +short $DOMAIN)"
  echo -e "IP:\t$IP"
}

#-------------------------------------------------------------
# tmux stuff
#-------------------------------------------------------------
tmuxfix() {
  TMUXPID=$(/bin/ps aux | /bin/grep "tmux new-session" | /usr/bin/head -1 | /usr/bin/awk '{print $2}')
  /bin/kill -10 $TMUXPID
}

#-------------------------------------------------------------
# Set editor
#-------------------------------------------------------------
export EDITOR='vim'

#-------------------------------------------------------------
# Tailoring 'less'
#-------------------------------------------------------------
alias more='less'
export PAGER=less
export LESSCHARSET='latin1'
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-' # Use this if lesspipe.sh exists.
#export LESS='-i -N -w  -z-4 -g -e -M -X -F -R -P%t?f%f stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'
# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#-------------------------------------------------------------
# Fun BASH variables
#-------------------------------------------------------------
export HISTSIZE=1000
export HISTFILESIZE=5000
export PYTHONWARNINGS=''
pwt() {
  if [ -z "${PYTHONWARNINGS}" ]; then
    export PYTHONWARNINGS="default"
  else
    export PYTHONWARNINGS=""
  fi
}
if [ -f /etc/default/cloudconvert ]; then
  source /etc/default/cloudconvert
fi
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
#-------------------------------------------------------------
# Spelling typos - highly personnal and keyboard-dependent :-)
#-------------------------------------------------------------

alias vi='vim'
alias sduo='sudo'
alias suod='sudo'

alias t='todo-txt'
alias todo.sh='todo-txt'

# BSPWM tab completion
_bspc() {
	local commands='node desktop monitor query rule wm subscribe config quit'

	local settings='external_rules_command status_prefix normal_border_color active_border_color focused_border_color presel_feedback_color border_width window_gap top_padding right_padding bottom_padding left_padding top_monocle_padding right_monocle_padding bottom_monocle_padding left_monocle_padding split_ratio automatic_scheme removal_adjustment initial_polarity directional_focus_tightness presel_feedback borderless_monocle gapless_monocle single_monocle pointer_motion_interval pointer_modifier pointer_action1 pointer_action2 pointer_action3 click_to_focus swallow_first_click focus_follows_pointer pointer_follows_focus pointer_follows_monitor mapping_events_count ignore_ewmh_focus ignore_ewmh_fullscreen ignore_ewmh_struts center_pseudo_tiled honor_size_hints remove_disabled_monitors remove_unplugged_monitors merge_overlapping_monitors'

	COMPREPLY=()

	if [[ $COMP_CWORD -ge 1 ]] ; then
		local current_word="${COMP_WORDS[COMP_CWORD]}"
		if [[ $COMP_CWORD -eq 1 ]] ; then
			COMPREPLY=( $(compgen -W "$commands" -- "$current_word") )
			return 0
		else
			local second_word=${COMP_WORDS[1]}
			case $second_word in
				config)
					if [[ $COMP_CWORD -eq 2 ]] ; then
						COMPREPLY=( $(compgen -W "$settings" -- "$current_word") )
						return 0
					fi
					;;
			esac
		fi
	fi
}

complete -F _bspc bspc

# vim: set ft=sh:
