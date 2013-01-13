#
# ~/.bash_profile
#
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/bin/vendor_perl #for ack

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx
fi
