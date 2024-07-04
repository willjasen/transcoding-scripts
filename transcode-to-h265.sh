#!/bin/bash

# Input file (passed by Plex DVR)
INPUT_FILE="$1"

# Output file (same name, but in H.265 format)
OUTPUT_FILE="${INPUT_FILE%.*}.h265.mkv"

# Convert video to H.265 using ffmpeg
# ffmpeg -i "$INPUT_FILE" -c:v libx265 -c:a copy "$OUTPUT_FILE"
ffmpeg -i "$INPUT_FILE" -preset medium -crf 28 -c:a aac -b:a 192k -c:v libx265 -c:a copy -map_metadata 0 "$OUTPUT_FILE"

# Check if the conversion was successful
if [ $? -eq 0 ]; then
    echo "Conversion successful!"
#    echo "Conversion successful. Deleting original file."
#    rm "$INPUT_FILE"
else
    echo "Conversion failed... keeping original file."
fi

exit 0
