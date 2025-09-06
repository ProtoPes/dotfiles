#!/bin/bash

# This script will remove first audio track from video files
# Pass a path to directory or a single video file

# TODO: Better logging
# TODO: Ability to remove subs
# TODO: By default leave only english audio track and subs
#
# variables
argument=$1

# function with main logic
delete_first_track() {
  local input=$1
  echo -n "Slicing $input..."
  local extention=$(echo $input | awk -F'.' '{print $NF}')
  ffmpeg -i "$input" -map 0 -map -0:a:0 -c copy "tmp.$extention" &>>/dev/null
  [[ $? ]] && mv "tmp.$extention" $input && echo "done"
}

# Traverse a directory and envoke delete_first_track for each entry
parse_directory() {
  local dir=$1
  local ls_output=$(ls -A $dir)
  for i in $ls_output; do
    delete_first_track $i
  done
}

if [[ -f $argument ]]; then
  echo "It's a file!"
  delete_first_track $argument
elif [[ -d $argument ]]; then
  echo "It's a directory!"
  parse_directory $argument
else
  echo "I don't know what this is!"
fi
