#!/bin/bash

mkdir samples
mkdir samples/main


SAMPLESIZE=5000
MAINFILES="/scratch/d.murray/mag-raw/main/*"

for f in $MAINFILES
do
    echo "Creating sample for main file $f"
    head -n $SAMPLESIZE $f > "samples/main/$(basename -- $f)"
done

mkdir samples/advanced
ADVFILES="/scratch/d.murray/mag-raw/advanced/*"

for f in $ADVFILES
do
    echo "Creating sample for advanced file $f"
    head -n $SAMPLESIZE $f > "samples/advanced/$(basename -- $f)"
done
