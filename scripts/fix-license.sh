#!/bin/bash
set -e

year=$(date +'%Y')
copyright="Steve Morin"

files=(
  ./py_launch_blueprint/__init__.py
  ./py_launch_blueprint/_version.py
  ./update_contributors.py
  ./tests/test_config.py
  ./tests/__init__.py
  ./tests/test_cli.py
  ./tests/test_api.py
  ./py_launch_blueprint/projects.py
)

for file in "${files[@]}"; do
  echo "Adding license to $file"
  addlicense -c "$copyright" -l mit -y "$year" "$file"
done
