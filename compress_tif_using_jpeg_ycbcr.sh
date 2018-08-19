#!/bin/bash

# Based on advice from:
# http://blog.cleverelephant.ca/2015/02/geotiff-compression-for-dummies.html
# and information from:
# https://www.gdal.org/gdal_translate.html

# If your input file has 4 bands, you'll need to specify the three bands and mask
# in order to use YCBCR colorspace
gdal_translate -co COMPRESS=JPEG -co PHOTOMETRIC=YCBCR -co TILED=YES -b 1 -b 2 -b 3 -mask 4 --config GDAL_TIFF_INTERNAL_MASK YES INFILE.tif OUTFILE.tif

# If your input file only has 3 bands, this is all you need:
gdal_translate -co COMPRESS=JPEG -co PHOTOMETRIC=YCBCR -co TILED=YES INFILE.tif OUTFILE.tif

