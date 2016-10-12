#!/bin/bash

# TODO: public right away?

###

for FILE in $(ls to-upload/*.mp4); do
SEQUENCE=$(cat sequence.txt)
SUFFIX=$(expr "$FILE" : '.*\([0-9]\{4\}.*\).mp4')
TIMESTAMP="${SUFFIX/-AM/T13:00:00.000Z}"
TIMESTAMP="${TIMESTAMP/-PM/T17:00:00.000Z}"

echo "Found $FILE - #$SEQUENCE - $SUFFIX"

python upload_video.py \
  --file="$FILE" \
  --title="Richmond Plaza building demolition timelapse #$SEQUENCE" \
  --date="$TIMESTAMP" \
  --description="The building is being demolished to make room for a new Dominion tower. http://www.richmond.com/business/local/article_9eb687d5-369a-520c-8971-0a34970f56a7.html" \
  --keywords="demolition,richmond,rva,timelapse,dominion" \
  --location="7th and Cary St, Richmond VA" \
  --latitude="37.538454" \
  --longitude="-77.439477" \
  --category="25" \
  --privacyStatus="private" && mv "$FILE" done/ && echo -n $(expr $(cat sequence.txt) + 1) > sequence.txt
done
