#!/bin/bash

echo '## 📁 Project Structure (Auto-generated)' > TREE.md
echo '```' >> TREE.md
tree -I '.git|.github|*.ipynb_checkpoints|__pycache__|*.o|*.out|venv|node_modules' >> TREE.md
echo '```' >> TREE.md

# Safely inject TREE.md into README.md between two markers
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
  }
  inside_block == 0
' README.md > README.tmp && mv README.tmp README.md
