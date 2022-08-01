#!/usr/bin/env bash

file_path=${1:?"Please give first argument for file path. e.g. /home/ashu"}
file_size=${2:?"Please give second argument for file size. options are 'c' for bytes, 'k' for Kilobytes 'M' for Megabytes, 'G' for Gigabytes. e.g 4k"}
operator=${3:?"Please give third argument as comparator. Options are 'equal', 'lesser' and 'greater' as per their actual meaning"}
echo "Scanning file path '${file_path}' for file size ${operator} ${file_size}"
#file_path="/home/ashu/work/"
# 'c' for bytes
# 'w' for two-byte words
# 'k' for Kilobytes
# 'M' for Megabytes
# 'G' for Gigabytes
#file_size="1c"
if [ "$operator" = "greater" ]; then
    find $file_path -type f -size "+${file_size}"
elif [ "$operator" = "lesser" ]; then
    find $file_path -type f -size "-${file_size}"
elif [ "$operator" = "equal" ]; then
    find $file_path -type f -size "${file_size}"
else
    echo "'${operator} is not supported please use 'equal', 'lesser' or 'greater'"
fi
