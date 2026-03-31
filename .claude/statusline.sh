#!/bin/bash

input=$(cat)

five=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
week=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
five_reset=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
week_reset=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')

bar() {
  local p=$(printf '%.0f' "$1")
  local filled=$((p / 5))
  [ "$p" -gt 0 ] && [ "$filled" -eq 0 ] && filled=1
  local empty=$((20 - filled))
  local b=''
  for ((i=0; i<filled; i++)); do b="${b}█"; done
  for ((i=0; i<empty; i++)); do b="${b}░"; done
  echo "$b"
}

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
folder=$(basename "$cwd")

branch=''
if [ -n "$cwd" ] && [ -d "$cwd/.git" ] || git -C "$cwd" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
fi

out=''
if [ -n "$folder" ]; then
  if [ -n "$branch" ]; then
    out="${folder}  ⎇ ${branch}"
  else
    out="${folder}"
  fi
fi

if [ -n "$five" ]; then
  r=''
  [ -n "$five_reset" ] && r=" ($(date -r "$five_reset" '+%H:%M'))"
  out="${out:+${out}\n}5h $(bar $five) $(printf '%.0f' "$five")%${r}"
fi

if [ -n "$week" ]; then
  r=''
  [ -n "$week_reset" ] && r=" ($(date -r "$week_reset" '+%a %H:%M'))"
  out="${out:+${out}\n}7d $(bar $week) $(printf '%.0f' "$week")%${r}"
fi

[ -n "$out" ] && echo -e "$out"
