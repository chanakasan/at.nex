nx_prompt_prefix="************* "
nx_prompt_prefix="############# "
nx_prompt_color='${nx_prompt_prefix}${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n${nx_prompt_prefix}\$ '
nx_prompt_gray='${nx_prompt_prefix}${debian_chroot:+($debian_chroot)}\u@\h:\w\n${nx_prompt_prefix}\$ '
prompt_orig_color='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
prompt_orig_gray='${debian_chroot:+($debian_chroot)}\u@\h:\w\n\$ '
export nx_ps1_orig=$PS1
export PS1=$nx_prompt_color
