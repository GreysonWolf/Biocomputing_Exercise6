# Thomas Joyce script for Exercise 6
# Usage: bash tj_exercise6.sh

# 1. Write a file containing the unique gender-yearsExperience combinations in the file wages.csv

cat wages.csv | cut -d, -f 1,2 | tr ',' ' ' | tail -n +2 | sort -k1,1 -k2,2n -u > gender_yrs_exp.txt

# 2. Return earnings information to stdout

echo "gender,yearsExperience,wage for the highest earner:" 
cat wages.csv | cut -d, -f 1,2,4 | tail -n +2 | sort -k3,3n -t, | tail -n 1

echo "gender,yearsExperience,wage for the lowest earner:"
cat wages.csv | cut -d, -f 1,2,4 | tail -n +2 | sort -k3,3n -t, | head -n 1

echo "number of females in the top 10 earners:" 
cat wages.csv | cut -d, -f 1,2,4 | tail -n +2 | sort -k3,3n -t, | tail -n 10 | grep "female" | wc -l

# 3. Return the effect of graduating college (12 vs. 16 years of school) on the minimum wage for earners to stdout

minwage_grad=$(cat wages.csv | cut -d, -f 3,4 | grep -E "^16" | sort -k2,2n -t, | head -n 1 | cut -d, -f 2) 

minwage_nongrad=$(cat wages.csv | cut -d, -f 3,4 | grep -E "^12" | sort -k2,2n -t, | head -n 1 | cut -d, -f 2)

echo "Difference in minumum wage between college graduates (16 years of school) and nongraduates (12 years of school):"
echo "$minwage_grad - $minwage_nongrad" | tr -d $'\r'| bc
