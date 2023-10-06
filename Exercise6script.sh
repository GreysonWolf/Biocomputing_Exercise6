# this file 1) creates the file genderYrsExp.txt with the gender and years of experience of each employee
# 2) returns the gender, years experience, and wage for the highest and the lowest earner to stdout
# 3) returns the effect of graduating college on minimum wage

# part 1. creating the genderYrsExp.txt file
# first, remove any existing genderYrsExp.txt file

# rm -i genderYrsExp.txt

# loop that orders the employees by years of experience for females, then males


for peeps in male, female
do
	cat wages.csv | grep -E ^$peeps | cut -d , -f 1,2 | 
sort -t , -k2 -n | sed 's/,/ /g' >> genderYrsExp.txt
done


# part 2. return highest/lowest earner and number of females in the top ten earners

# return highest earner:

echo " "

echo "Highest earner's gender, years of experience, and wage: "
cat wages.csv | sort -t , -k4 -n | cut -d , -f 1,2,4 | tail -n 1

# return lowest earner 

echo " "

echo "Lowest earner's gender, years of experience, and wage: "
cat wages.csv | grep -v "wage" | sort -t , -k4 -n | cut -d , -f 1,2,4 | head -n 1

# return the number of females in the top ten earners of this set

echo " "

echo "Number of females in the top 10 earners: "
cat wages.csv | sort -t , -k4 -n | tail -n 10 | grep -c "female"

# return effect of graduating college on minimum wages to stdout

echo " "
echo "Effect of College on Wages"

colMinWage=$(cat wages.csv | cut -d , -f 3,4 | grep "16," | cut -d , -f 2 | sort -n | head -n 1)
noColMinWage=$(cat wages.csv | cut -d , -f 3,4 | grep "12," | cut -d , -f 2 | sort -n | head -n 1)

# everything up until this step was successful.  my system did not work with the bc command

echo "$colMinWage - $noColMinWage" | bc
