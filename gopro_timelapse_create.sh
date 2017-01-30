#!/bin/sh

# encode all pending videos into timelapses

for DIR in $(\ls -d 201*); do

  if [ $(find "$DIR" -maxdepth 0 -type d -empty 2> /dev/null) ]; then
    continue
  fi

  OUTFILE=to-upload/gopro_timelapse_out_$DIR.mp4
  if [ -f $OUTFILE ]; then
    continue
  fi

  LISTFILE=goprolist_$DIR.txt
  ls $DIR/G*.MP4 | sed 's/^/file /' > $LISTFILE
  ./ffmpeg/bin/ffmpeg.exe \
    -f concat -i $LISTFILE -an -filter:v "setpts=0.02*PTS" \
    -crf 21 -codec:v libx264 -bf 2 -flags +cgop -pix_fmt yuv420p \
    $OUTFILE
  rm $LISTFILE
done
