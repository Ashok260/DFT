#!/bin/bash

# Generate a directory tree (excluding .git and other unwanted dirs)
echo '## 📁 Project Structure' > TREE.md
echo '```' >> TREE.md
tree -I '.git|*.ipynb_checkpoints|__pycache__|*.o|*.out|venv|node_modules' >> TREE.md
echo '```' >> TREE.md
