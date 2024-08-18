#!/bin/bash

find . -type f -name "*.m4a" | while read -r input_file; do
    output_dir="$(dirname "$input_file")/output"

    if [ ! -d "$output_dir" ]; then
        echo "Creating directory: $output_dir"
        mkdir -p "$output_dir"
    fi

    base_name=$(basename "$input_file" .m4a)

    echo "Processing file: $input_file"
    echo "Output file: $output_dir/$base_name.mp3"

    ffmpeg -i "$input_file" -b:a 320k "$output_dir/$base_name.mp3"
done
