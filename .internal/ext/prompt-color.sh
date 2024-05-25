# notes:
# - \033 is same as \e

nx_set_prompt_color() {
  local c32="\[\e[01;32m\]"
  local c34="\[\e[01;34m\]"
  local c0="\[\e[01;00m\]"
  local c235="\[\e[38;5;235m\]"
  local reset="\[\e[00m\]"
  local nx_prefix_str="############# "
  local nx_prompt_prefix="${c235}${nx_prefix_str}${reset}"
  local nx_prompt_top="${c32}\u@\h${reset}:${c34}\w${reset}\n"
  local nx_prompt_end="${c0}\$${reset} "
  # custom
  nx_prompt_color="${nx_prompt_prefix}${nx_prompt_top}${nx_prompt_prefix}${nx_prompt_end}"
  export nx_ps1_orig=$PS1
  export PS1=$nx_prompt_color
}

nx_set_prompt_color
