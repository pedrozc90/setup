#!/bin/bash

# files normalization: add new line at the end of files
find ${PWD} -type f \( -iname *.md -o -iname *.yml -o -iname *.yaml -o -iname *.sh \) | while read file; do tail -n1 $file | read -r _ || echo >> $file; done
