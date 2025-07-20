#!/bin/bash

# Create TREE.md with a formatted directory structure
{
  echo '## 📁 Project Structure (Auto-generated)'
  echo '```'
  tree -I '.git|.github|*.ipynb_checkpoints|__pycache__|*.o|*.out|venv|node_modules'
  echo '```'
} > TREE.md
