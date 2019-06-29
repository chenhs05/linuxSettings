#!/bin/bash

intermediate_file="hop.pdf"
final_file="$1"

## Pre-flight tests

#echo "
#*** Usage:
#       scan2pdf.sh filename.pdf
#
#"

## Batch scan PDF scanner

echo "Scanning..."
scanimage --batch --mode=color --format=tiff --resolution 300
echo "Temp file saved to: $temp_file"

## Merge TIF and to PDF

tiffcp out*.tif hop.tif
convert hop.tif $intermediate_file

## Shrink PDF

echo "Shrinking..."
ps2pdf $intermediate_file $final_file
# gs -q -dNOPAUSE -dBATCH -dSAFER        \
#    -sDEVICE=pdfwrite                   \
#    -dCompatibilityLevel=1.4            \
#    -dPDFSETTINGS=/ebook                \
#    -dEmbedAllFonts=true                \
#    -dSubsetFonts=true                  \
#    -dColorImageDownsampleType=/Bicubic \
#    -dColorImageResolution=300          \
#    -dGrayImageDownsampleType=/Bicubic  \
#    -dGrayImageResolution=300           \
#    -dMonoImageDownsampleType=/Bicubic  \
#    -dMonoImageResolution=300           \
#    -sOutputFile=$final_file           \
#    $intermediate_file
echo "Remove Title exif information..."
exiftool -Title="" -overwrite_original $final_file
echo "File saved to: $final_file"

## Cleaning

echo "Cleaning ..."
rm out*.tif hop.tif $intermediate_file

echo "Done!"
