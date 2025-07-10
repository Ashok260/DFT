#!/bin/bash

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
