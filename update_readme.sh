#!/bin/bash

# Read the contents of TREE.md
TREE_CONTENT=$(<TREE.md)

# Use awk to insert the TREE_CONTENT between the placeholders in README.md
awk -v tree="$TREE_CONTENT" '
  /<!-- START OF TREE -->/ { print; print tree; skip=1; next }
  /<!-- END OF TREE -->/ { skip=0 }
  !skip
' README.md > README.tmp && mv README.tmp README.md
