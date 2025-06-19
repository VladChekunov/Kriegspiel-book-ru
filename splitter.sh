#!/bin/bash

csplit -z -f "build/parts/part" -b "_%03d.md" "original.md" '/^$/' '{*}' 2>/dev/null

for file in build/parts/part_*.md; do

    sed -i 's/\. /\. \n\n/g' "$file"

done
