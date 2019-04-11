#!/bin/bash
if [ ! $# == 2 ]; then
  echo "Please specify the source file and how many lines to split on."
  echo "    sh ./txtfile-splitter.sh <Source File> <Lines per file>"
  exit
fi

# create a directory to store the output:
mkdir out

# create a temporary file containing the header without
# the content:
head -n 1 $1 > header.txt

# create a temporary file containing the content without
# the header:
tail +2 $1 > content.txt

# split the content file into multiple files of specified number of lines each:
split -l $2 content.txt out/data_

# loop through the new split files, adding the header
# and a '.txt' extension:
for f in out/*; do cat header.csv $f > $f.txt; rm $f; done;

# remove the temporary files:
rm header.txt
rm content.txt
