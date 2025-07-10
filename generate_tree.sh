#!/bin/bash

# Create a fresh TREE.md file with the directory structure
echo '## 📁 Project Structure (Auto-generated)' > TREE.md
echo '```' >> TREE.md
tree -I '.git|.github|*.ipynb_checkpoints|__pycache__|*.o|*.out|venv|node_modules' >> TREE.md
echo '```' >> TREE.md
