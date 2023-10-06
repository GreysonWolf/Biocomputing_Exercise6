# This script will list the top ten female earners
# Usage: bash topfemaleearners.sh

cat wages.csv | grep 'female' | sort -t , -k4 -n -r | head -n 10 > topfemaleearners.txt
