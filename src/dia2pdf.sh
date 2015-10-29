#!/bin/sh
## the filename without the extension .dia
ROOT=${1:0:${#1}-4}

TMPFILE=$(tempfile)

# create an EPS file
dia -e $TMPFILE -t eps $1 

# transform that EPS to a PDF
ps2pdf -dEPSCrop $TMPFILE $ROOT.pdf

# remove the temp file
rm $TMPFILE
