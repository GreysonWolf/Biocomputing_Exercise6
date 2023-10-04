#part 1
cat wages.csv | cut -d , -f 1,2 | sort -t , -k1,1d -k2,2n > Gender-YearsExperience.csv

#part 2
echo "highest earner:"
cat wages.csv | sort -t , -k 4 | tail -n 2 | head -n 1 | cut -d , -f 1,2,4
echo "lowest earner:"
cat wages.csv | sort -t , -k 4 | head -n 1 | cut -d , -f 1,2,4
echo "number of females in top ten earners:"
cat wages.csv | sort -t , -k 4 | tail -n 11 | head -n 10 | grep -E "female" | wc -l

#part 3
HighSchoolMinimum=$(cat wages.csv | grep -E "[a-z]+\,[1-9]{1,2},12" | sort -t , -k4,4n | head -n 1 | cut -d , -f 4)
CollegeMinimum=$(cat wages.csv | grep -E "[a-z]+\,[1-9]{1,2},16" | sort -t , -k4,4n | head -n 1 | cut -d , -f 4)
echo "College Minimum - High School Minimum (the effect of graduating college on the minimum wage):"
echo "$CollegeMinimum - $HighSchoolMinimum" | bc
