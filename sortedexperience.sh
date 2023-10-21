# This script will sort the data for gender and in order of work experience listed from lowest amount of years to the most.

# usage: bash sortedexperience.sh

cat wages.csv | cut -d , -f 1,2 | sort -t ,  -k 1,1d -k 2,2n | tr ',' ' ' > sortedexperience.txt
