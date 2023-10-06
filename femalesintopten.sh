# This script will list the number of females in the top ten earners
# Usage: bash topfemaleearners.sh

cat wages.csv | sort -t , -k4 -n -r | head -n 10 | grep 'female' | wc -l > femalesintopten.txt
