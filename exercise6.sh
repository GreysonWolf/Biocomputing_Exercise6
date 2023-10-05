# part 1
# unique combinations of gender and years experience. separate by space, sort by gender, then years experience
cat wages.csv | cut -d , -f 1,2 | grep "male" | sort -u -t , -k 1,2 > gender_bday_unique.txt


# part 2
# highest earner:
echo highest earner
cat wages.csv | cut -d , -f 1,2,4 | grep "male" | sort -r -t , -k 4 | head -1

# lowest earner:
echo lowest earner
cat wages.csv | cut -d , -f 1,2,4 | grep "male" | sort -t , -k 4 | head -1

# females in top ten earners
echo number of females in the top ten earners
cat wages.csv | sort -r -t , -k 4 | head -11 | tail -10 | grep -o "female" | wc -l


# part 3
echo difference between wages of high school and college graduates
wage_12=$(cat wages.csv | cut -d , -f 3,4 | grep -w -E "^12" | sort -t , -k 4 | cut -d , -f 2 | head -1)
wage_16=$(cat wages.csv | cut -d , -f 3,4 | grep -w -E "^16" | sort -t , -k 4 | cut -d , -f 2 | head -1)
echo $wage_16-$wage_12 | bc
