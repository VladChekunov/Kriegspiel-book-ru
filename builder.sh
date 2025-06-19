#!/bin/bash

output_file="build/translation.md"

> "build/translation.md"

first_file=true

for file in ./src/*.md; do
    [[ -f "$file" ]] || continue
    
    [[ "$file" == "$output_file" ]] && continue
    if [[ "$first_file" == false ]]; then
        echo -e "" >> "$output_file"
    fi
    first_file=false

    mapfile -t lines < "$file"

    i=0
    while (( i < ${#lines[@]} )); do
        while (( i < ${#lines[@]} )) && [[ -z "${lines[i]//[[:space:]]/}" ]]; do
            ((i++))
        done

        ((i++))
        while (( i < ${#lines[@]} )) && [[ -z "${lines[i]//[[:space:]]/}" ]]; do
            ((i++))
        done
        
        (( i < ${#lines[@]} )) && echo "${lines[i]}" >> "$output_file"
        ((i++))
    done
done

pandoc "$output_file" -o "${output_file}.pdf" --pdf-engine=xelatex --variable mainfont="FreeSerif"
