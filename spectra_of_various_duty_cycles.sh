#!/bin/bash
rm -rf img/*

octave spectra_of_various_duty_cycles.m

convert -delay 20 img/* -loop 0 -resize 1200x675 spectra_of_various_duty_cycles.gif
