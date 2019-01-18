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
# Ansible stuff
#-------------------------------------------------------------
alias ansible='/opt/ansible/bin/python /opt/ansible/bin/ansible'
alias ansible-console='/opt/ansible/bin/python /opt/ansible/bin/ansible-console'
alias ansible-doc='/opt/ansible/bin/python /opt/ansible/bin/ansible-dc'
alias ansible-galaxy='/opt/ansible/bin/python /opt/ansible/bin/ansible-galaxy'
alias ansible-playbook='/opt/ansible/bin/python /opt/ansible/bin/ansible-playbook'
alias ansible-pull='/opt/ansible/bin/python /opt/ansible/bin/ansible-pull'
alias ansible-vault='/opt/ansible/bin/python /opt/ansible/bin/ansible-vault'

#--------------------------------------------------------------
# Python stuff
#--------------------------------------------------------------
alias venv2='virtualenv --python=python2 env'
alias venv3='virtualenv --python=python3 env'

#--------------------------------------------------------------
#erochow originals
#--------------------------------------------------------------
alias tmuxre='tmux -2 attach-session -d -t de || /usr/bin/tmux_config'
alias tmuxprog='tmux -2 attach-session -d -t prog || tmux new-session -s prog'
alias tmuxlab='tmux attach-session -d -t lab || tmux new-session -s lab'
alias orwell='ssh -4 www.ericrochow.net -p 29070'
alias asimov='ssh -4 www.ericrochow.net -p 29071'
alias cypher='sudo lxc exec bots.noc:cypher bash'
alias salesforce='sudo lxc exec bots.noc:salesforce bash'
alias ssh='TERM=xterm ssh'
alias whoisas='whois -h whois.cymru.com -v'
alias forecast='curl -so /tmp/weather http://wttr.in ; cat /tmp/weather | egrep -e "City:|Feature:|@igor" -v'
alias kpcli='kpcli --kdb /opt/keepass/erochow.kdbx'
alias chromium-browser='/usr/lib/chromium-browser/chromium-browser --enable-plugins %U'
alias route-views='telnet route-views.routeviews.org'
alias att='telnet route-server.ip.att.net'
alias comcast='telnet route-server.newyork.ny.ibone.comcast.net'
alias he='telnet route-server.he.net'
alias updates='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apm upgrade && sudo aideinit -f -y -b'
alias lab='telnet lab.noc.liquidweb.com'
alias bogons='whois -h whois.radb.net fltr-bogons'

#-------------------------------------------------------------
# wks-specific aliases
#-------------------------------------------------------------
case $(hostname) in
  "beardofprey")
    alias vpslogin='ssh -i ~/.ssh/host.beardofprey.net.key erochow@lwvps.ericrochow.net'
    alias orwell-rsync='rsync -avz -e "ssh -p 29070 -i /home/erochow/.ssh/host.beardofprey.net.key.pub"'
    alias ine-rsync='rsync -avzru -e "ssh -p 29070 -i /home/erochow/.ssh/host.beardofprey.net.key.pub" ~/Videos/ erochow@www.ericrochow.net:/media/Media/Video/Puters/'
    alias sdnify='/home/erochow/Scripts/sdnify/env/bin/python /home/erochow/Scripts/sdnify/sdnify.py'
    alias unicorndust='/home/erochow/Scripts/sdnify/env/bin/python /home/erochow/Scripts/sdnify/unicorndust.py'
    alias cypherpost='/home/erochow/Scripts/sdnify/env/bin/python /home/erochow/Scripts/sdnify/cypherpost.py'
    alias nocpasswd='ssh noc "sudo cat /home/passwords/newpasswords7-now_in_use_now"'
    alias autopw='ssh noc "sudo grep automation /home/passwords/newpasswords7-now_in_use_now " | awk '"'"'{print $2}'"'"''
    alias autossh='sshpass -p $(autopw) ssh -l automation'
    ;;
  "beardofprey-lt")
    ;;
  *)
    ;;
esac

#-------------------------------------------------------------
# ssh host aliases
#-------------------------------------------------------------

alias eqx1='ssh lw-eqx-border1.rtr'
alias eqx2='ssh lw-eqx-border2.rtr'
alias tlx1='ssh lw-tlx-border1.rtr'
alias tlx2='ssh lw-tlx-border2.rtr'

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
export PYTHONWARNINGS='default'
source /etc/default/cloudconvert
#-------------------------------------------------------------
# Spelling typos - highly personnal and keyboard-dependent :-)
#-------------------------------------------------------------

alias vi='vim'
alias sduo='sudo'
alias suod='sudo'

