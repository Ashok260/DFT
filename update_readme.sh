#!/bin/bash

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
