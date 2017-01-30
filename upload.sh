#!/bin/bash

###

for FILE in $(ls to-upload/*.mp4); do
SUFFIX=$(expr "$FILE" : '.*\([0-9]\{4\}.*\).mp4')
TIMESTAMP="${SUFFIX/-AM/T13:00:00.000Z}"
TIMESTAMP="${TIMESTAMP/-PM/T17:00:00.000Z}"
TIMEDESC="${SUFFIX/-AM/ AM}"
TIMEDESC="${TIMEDESC/-PM/ PM}"

echo "Found $FILE - $SUFFIX"

python upload_video.py \
  --file="$FILE" \
  --title="Richmond Plaza building construction timelapse $TIMEDESC" \
  --date="$TIMESTAMP" \
  --description="Construction of the new Dominion tower at 7th and Cary." \
  --keywords="construction,richmond,rva,timelapse,dominion" \
  --location="7th and Cary St, Richmond VA" \
  --latitude="37.538454" \
  --longitude="-77.439477" \
  --category="25" \
  --playlist="PL1cNOU1HfaMI8ha3e3iUsocQuoXH70CvF" \
  --privacyStatus="public" && mv "$FILE" "$SUFFIX" done/
done
