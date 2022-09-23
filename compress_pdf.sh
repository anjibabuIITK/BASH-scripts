#!/bin/bash
# Compressing the PDF to low size
pdf2ps main.pdf very_large.ps
ps2pdf -dPDFSETTINGS=/screen -dDownsampleColorImages=true -dColorImageResolution=200 -dColorImageDownsampleType=/Bicubic very_large.ps compressed.pdf
