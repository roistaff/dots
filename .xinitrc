export XDG_SESSION_TYPE=x11
#exec awesome
##picom &
#dunst &
#ibus-daemon -rxRd &
#clipsim --daemon &
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
#sxhkd &
exec bspwm
#exec sxwm
