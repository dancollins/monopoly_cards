#!/bin/bash

rm cards.txt

while (( "$#" )); do
    cat "$1" | sed -e 's/\$/\\\\$/g' | while read x; do
	echo "\createcard{`basename "$1" .txt`}{$x}" >> cards.txt
    done
    shift
done

pdflatex cards.tex
