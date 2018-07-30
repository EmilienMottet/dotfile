# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

export PATH="$HOME/.cargo/bin:$PATH"

export XKB_DEFAULT_LAYOUT=fr; export XKB_DEFAULT_VARIANT=oss; export XKB_DEFAULT_MODEL=pc105;
