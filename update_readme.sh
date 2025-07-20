#!/bin/bash

# Replace section in README.md between markers with contents of TREE.md

awk '
  BEGIN { inside = 0 }
  /<!-- START OF TREE -->/ {
    print;
    while ((getline line < "TREE.md") > 0) print line;
    inside = 1;
    next;
  }
  /<!-- END OF TREE -->/ {
    inside = 0;
    print;
    next;
  }
  inside == 0
' README.md > README.tmp

# Overwrite the original README.md
mv README.tmp README.md
