# This script will determine the effect of graduating college on minimum wage
# usage: bash effectofcollege.sh

minimum_wage_college=$(cat wages.csv | cut -d , -f 3,4| grep -E '16,' | sort -t , -k 2 -n | head -n 1 | cut -d , -f 2)
minimum_wage_nocollege=$(cat wages.csv | cut -d , -f 3,4 | grep -E '12,' | sort -t , -k 2 -n | head -n 1 | cut -d , -f 2)

effect_of_college=$(echo "$minimum_wage_nocollege - $minimum_wage_college" | bc)

echo "The effect of college on minimum wage is: \$ "$effect_of_college" " > effectofcollege.txt
