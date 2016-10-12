#!/bin/sh

#DIR=2016-10-03-AM
#
#ls $DIR/G*.MP4 | sed 's/^/file /' > goprolist_$DIR.txt
#
#../ffmpeg-20160815-3282e31-win64-static/bin/ffmpeg.exe \
# -f concat -i goprolist_$DIR.txt -an -filter:v "setpts=0.02*PTS" \
#  to-upload/gopro_timelapse_out_$DIR.mp4
#
#rm goprolist_$DIR.txt

# this should encode all pending videos

for DIR in $(\ls -d 201*); do

  OUTFILE=to-upload/gopro_timelapse_out_$DIR.mp4
  if [ -f $OUTFILE ]; then
    continue
  fi

  LISTFILE=goprolist_$DIR.txt
  ls $DIR/G*.MP4 | sed 's/^/file /' > $LISTFILE
  ./ffmpeg/bin/ffmpeg.exe \
    -f concat -i $LISTFILE -an -filter:v "setpts=0.02*PTS" \
    $OUTFILE
  rm $LISTFILE
done
