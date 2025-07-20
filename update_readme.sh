#!/bin/bash

# Replaces the content in README.md between <!-- START OF TREE --> and <!-- END OF TREE -->
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
' README.md > README.tmp && mv README.tmp README.md
