#!/bin/bash
set -e  # Stop script on any error

# STEP 1: Generate TREE.md safely
echo '## 📁 Project Structure (Auto-generated)' > TREE.md
echo '```' >> TREE.md
tree -I '.git|.github|*.ipynb_checkpoints|__pycache__|*.o|*.out|venv|node_modules' >> TREE.md || true
echo '```' >> TREE.md

# STEP 2: Inject TREE.md content into README.md between markers

# Create a temporary file to hold the new README
TMP_README=$(mktemp)

awk '
  BEGIN { in_block = 0 }
  /<!-- START OF TREE -->/ {
    print
    while ((getline line < "TREE.md") > 0) print line
    in_block = 1
    next
  }
  /<!-- END OF TREE -->/ {
    in_block = 0
  }
  in_block == 0
' README.md > "$TMP_README"

# Replace the original README.md
mv "$TMP_README" README.md
