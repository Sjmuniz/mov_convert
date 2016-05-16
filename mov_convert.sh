#!/bin/bash
#mov_convert reduces size of Panasonic tz5 (or any other .MOV supported by ffmpeg) camera 
#at current dir or other path into an efficient x265 mkv file

#check for ffmpeg.
FFMPEG=$(which ffmpeg)
[ -x $FFMPEG ] || exit 0
echo -e ffmpeg binary located at: $FFMPEG

#find target dir. 
TARGET=$1
if [ "$TARGET" = "" ]; then
           TARGET=$(pwd) || true
fi
echo Target $TARGET

for i in $(find $TARGET/ -type f -name '*.MOV|*.mov')
 do
    echo "Procesando $i"
    ffmpeg -i $i -c:v libx264 -preset medium -crf 27 -c:a libmp3lame -b:a 128k $i'_chico.mkv'
 done
