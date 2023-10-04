# script usage: bash Assignment.sh

# part 1 
cat wages.csv | cut -d, -f 1,2 | sort -u |sed 's/gender,yearsExperience//g' | sort -b -n -t "," -k1b,1 -k2,2 | tr "," " " > AssignmentPart1.txt

# part 2

echo "the gender, yearsExperience, and wage for the highest earner"
cat wages.csv | cut -d, -f 1,2,4 |sed -E 's/gender,yearsExperience,wage//g' | sort -n -t "," -k 3 | tail -n 1

echo "the gender, yearsExperience, and wage for the lowest earner" 
cat wages.csv | cut -d, -f 1,2,4 |sed 's/gender,yearsExperience,wage//g' | sort -n -t "," -k 3 | head -n 2

echo  "the number of females in the top ten earners in this data set"
cat wages.csv | cut -d, -f 1,2,4 |sed 's/gender,yearsExperience,wage//g' | sort -n -t "," -k 3 | tail -n 10 | grep -c "female"

# part 3

echo "the effect of graduating college on the minimum wage for earners in this dataset"
MinWage12=$(cat wages.csv | cut -d, -f 3,4 |sed -E 's/gender,yearsExperience,wage//g'| grep -E "12," | sort -n -t "," -k 2 | 
head -n 1 | sed 's/12,//g')
MinWage16=$(cat wages.csv | cut -d, -f 3,4 |sed -E 's/gender,yearsExperience,wage//g'| grep -E "16," | sort -n -t "," -k 2 | 
head -n 1 | sed 's/16,//g')
echo "$MinWage16 - $MinWage12" | bc 
