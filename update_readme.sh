#!/bin/bash

<<<<<<< HEAD
# Safely read TREE.md line-by-line into the README.md
awk '
  BEGIN { inside_block = 0 }
  /<!-- START OF TREE -->/ {
    print
    while ((getline line < "TREE.md") > 0) print line
    inside_block = 1
    next
  }
  /<!-- END OF TREE -->/ {
    inside_block = 0
    print
    next
  }
  !inside_block
' README.md > README.tmp && mv README.tmp README.md
=======
# Read contents of TREE.md
TREE_CONTENT=$(<TREE.md)

# Use sed to replace the block between START and END
# Create a temp file with the updated README
sed -e '/<!-- START OF TREE -->/,/<!-- END OF TREE -->/c\
<!-- START OF TREE -->\
'"$TREE_CONTENT"'\
<!-- END OF TREE -->' README.md > README.tmp

# Replace the original README with the updated one
mv README.tmp README.md
>>>>>>> refs/remotes/origin/main
