#!/bin/sh
sed -i \
         -e 's/#D0CCD0/rgb(0%,0%,0%)/g' \
         -e 's/#605856/rgb(100%,100%,100%)/g' \
    -e 's/#3BCEAC/rgb(50%,0%,0%)/g' \
     -e 's/#40bfff/rgb(0%,50%,0%)/g' \
     -e 's/#eff0f9/rgb(50%,0%,50%)/g' \
     -e 's/#2d303d/rgb(0%,0%,50%)/g' \
	"$@"
