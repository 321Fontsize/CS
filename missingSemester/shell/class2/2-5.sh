#!/bin/bash

filepath=$(pwd)

find "$filepath" -type f -exec stat --format="%Y %n" {} \; | sort -n | tail -n 10 | cut -d' ' -f2-
# find . -type f -exec stat --format="%Y %n" {} \; | sort -n | tail -n 10 | cut -d' ' -f2-


:<<COMMENT
find /path/to/directory -type f: Recursively find all regular files in the specified directory.

-exec stat --format="%Y %n" {} \;: For each file found, execute the stat command to retrieve the modification time in seconds since the epoch (%Y) and the file name (%n). The results are printed to the standard output.

| sort -n: Pipe the output to sort to sort the files based on modification time in ascending order (-n for numerical sort).

| tail -n 1: Use tail to get the last (most recent) line, which corresponds to the most recently modified file.
    1 can be changed to num m: the last m lines.

| cut -d' ' -f2-: Use cut to extract the file name, starting from the second field to the end (handles file names with spaces).
COMMENT