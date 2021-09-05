#!/bin/bash

# references: 
# https://gist.github.com/larshaendler/723d2ec447c3c694b71dc6e3bc3aadc9
# https://unix.stackexchange.com/questions/269444/when-using-the-cp-command-to-copy-multiple-files-can-you-rename-the-files-when
# https://stackoverflow.com/questions/6744006/can-i-use-sed-to-manipulate-a-variable-in-bash


# rename multiple filename.log to filename_old.log
for file in *.log; do cp "$file" "$(basename "$file" | sed -e 's/\.log/_old\.log/g')"; done;
