nx_set_prompt() {
  local nx_prefix_str="############# "
  local nx_prompt_prefix="${nx_prefix_str}"
  local nx_prompt_top="\u@\h:\w\n"
  local nx_prompt_end="\$ "
  # result
  nx_prompt_color="${nx_prompt_prefix}${nx_prompt_top}${nx_prompt_prefix}${nx_prompt_end}"
  export nx_ps1_orig=$PS1
  export PS1=$nx_prompt_color
}

nx_set_prompt
