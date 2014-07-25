#!/bin/bash

while (( "$#" )); do
    cat $1 | sed -e 's/\$/\\$/' | while read x; do
	echo "\createcard{`basename $1 .txt`}{$x}" >> cards.txt
    done
    shift
done

pdflatex cards.tex
