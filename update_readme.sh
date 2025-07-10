#!/bin/bash

# Assumes TREE.md has already been generated

START="<!-- START OF TREE -->"
END="<!-- END OF TREE -->"
TREE_CONTENT=$(<TREE.md)

awk -v start="$START" -v end="$END" -v tree="$TREE_CONTENT" '
    BEGIN { print_tree = 0 }
    {
        if ($0 == start) {
            print $0
            print_tree = 1
            print tree
        } else if ($0 == end) {
            print_tree = 0
            print $0
        } else if (!print_tree) {
            print $0
        }
    }
' README.md > README.tmp && mv README.tmp README.md
