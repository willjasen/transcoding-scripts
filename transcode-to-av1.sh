#!/bin/bash

# Input file (passed by Plex DVR)
INPUT_FILE="$1"
echo "Input file is: ${INPUT_FILE}";

# Output file (same name, but in AV1 format)
OUTPUT_FILE="${INPUT_FILE%.*}.av1.mkv"

# Convert video to AV1 using ffmpeg
ffmpeg -i "$INPUT_FILE" -c:v libaom-av1 -crf 30 -b:v 0 -strict experimental -map_metadata 0 -c:a copy "$OUTPUT_FILE"

# Check if the conversion was successful
if [ $? -eq 0 ]; then
    echo "Conversion successful!"
#    echo "Conversion successful. Deleting original file."
#    rm "$INPUT_FILE"
else
    echo "Conversion failed... keeping original file."
fi

exit 0
