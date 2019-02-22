#!/bin/bash

YELLOW="\e[33m"
DEFAULT="\e[39m"

# commands file
commands=$1
post_commands=$2
cursor=1

if [[ -z $commands ]]; then
  echo "Usage: source demoshell.sh <commands-file> [<post-commands-file>]"
  return 1
fi

# Print next command to be executed
np() {
  desc=`sed -n "${cursor}p" <$commands`
  echo -e $YELLOW"> "$desc $DEFAULT
  cmd=`sed -n "$((cursor+1))p" <$commands`
  echo -e $YELLOW"> "$cmd $DEFAULT
}

# Execute next command and increment cursor
n() {
  if [[ $cursor -ge `cat $commands | wc -l` ]]; then
    echo -e $YELLOW "Demo is complete! Do cleanup your mess: "
    cat $post_commands
    echo -e $DEFAULT
    return 0
  fi  
  desc=`sed -n "${cursor}p" <$commands`
  echo -e $YELLOW"> "$desc $DEFAULT
  cmd=`sed -n "$((cursor+1))p" <$commands`
  echo -e $YELLOW"> "$cmd $DEFAULT
  eval $cmd
  a
}

# Reset cursor
r() {
  cursor=1
}

# Move cursor forward 
a() {
  cursor=$((cursor+2))
}

# Mock cursor backwards
b() {
  cursor=$((cursor-2))
}

# Show demo plan
plan() {
  echo -e $YELLOW
  cat $commands | grep "#" | sed 's/^#/ /' | sed "$((cursor/2 + 1))s/^ />/"
  echo -e $DEFAULT
}
