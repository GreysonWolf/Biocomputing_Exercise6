# This script will lsit the gender, years of experience and wage for the 
# highest earner
# usage: bash highestearner.sh

cat wages.csv | cut -d , -f 1,2,4 | sort -t , -k 3 -n -r | head -n 1 > highestearner.txt
