#!/bin/bash

# Ensure a URL is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <YouTube URL>"
    exit 1
fi

URL="$1"

# Fetch video metadata in JSON format
METADATA=$(yt-dlp -j "$URL")

# Extract the video ID
VIDEO_ID=$(echo "$METADATA" | jq -r '.id')

# Ensure the transcripts directory exists
mkdir -p transcripts

# Define the output file
OUTPUT_FILE="./transcripts/${VIDEO_ID}.json"

# Extract only the necessary fields and save to file
echo "$METADATA" | jq -c '{
    id,
    title,
    thumbnail,
    description,
    channel_id,
    channel_url,
    duration,
    webpage_url,
    tags,
    uploader,
    uploader_id,
    uploader_url,
    upload_date,
    timestamp,
    availability,
    fulltitle,
    duration_string,
    url
}' > "$OUTPUT_FILE"

echo "Metadata saved to: $OUTPUT_FILE"
