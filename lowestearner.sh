# This script will list the gender, years of experience and the wage for the lowest earner
# usage: bash lowestearner.sh

cat wages.csv | cut -d , -f 1,2,4 | sort -t , -k 3 -n -r | tail -n 2 | head -n 1 > lowestearner.txt
