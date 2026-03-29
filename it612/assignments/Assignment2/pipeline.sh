#!/bin/bash
# Assignment 2, Exercise 4: Read, Sort and Trim
#
# Given input.dat (created below), do three things:
#   1. Sort the lines in DESCENDING order
#   2. Save the full sorted result to sorted.dat
#   3. Print to stdout: skip the first line, then show the next 5 lines
#
# Hint: Think pipeline — you can do this in very few lines.
#       Look into: sort, tee, head, tail

printf "3\n2\n10\n5\n100\n25\n12\n13\n6\n" > input.dat

sort -nr input.dat > sorted.dat # sort contents of input .dat in numeric reverse order, then redirect to sorted.dat
tail -n +2 sorted.dat | head -n 5 # start at line 2 in sorted.dat and read everything after. pipe the output to the head -n 5 command to read the next 5 lines of the result
