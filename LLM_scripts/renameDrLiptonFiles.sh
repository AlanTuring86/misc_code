#!/bin/bash

# Script to rename video files by lecture number
#example call: ./renameDrLiptonFiles.sh /mnt/c/Users/odabr/Videos/MRI/MRI_einstein_Lipton_lectures/renamed

# Set current directory
cd "$1"

# Loop through files in the current directory
for f in *; do

  if [[ $f =~ "56" ]]; then #56 because there were 56 lectures and the pattern is "...X of 56..." the other videos should not be renamed
    
    # Find the lecture number
    lecture_number=$(echo $f | grep -o -E '[0-9]+ of 56')
    
    # Get the other part of the filename
    rest_of_filename=$(echo $f | sed -e "s/$lecture_number//")
    
    # Rename the file
    mv "$f" "${lecture_number}_${rest_of_filename}"
  fi
  
done