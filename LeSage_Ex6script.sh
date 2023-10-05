echo "Question 1:"
cat wages.csv | sort -n -t ',' -k 2 | cut -d, -f 1,2 | tr ',' ' '  > combos.txt
echo "Check directory for created file combos.txt"
echo "Question 2:"
cat wages.csv | sort -n -t ',' -k 4 | grep "female"| head -n 1
cat wages.csv | sort -n -t ',' -k 4 -r | head -n 1
cat wages.csv | sort -n -t ',' -k 4 -r | head -n 10 | grep "female" | wc -l
echo "Question 3:"
lowest12=$(cat wages.csv | grep ",12," | sort -n -t ',' -k 4 | head -n 1 | 
cut -d, -f 4)
lowest16=$(cat wages.csv | grep ",16," | sort -n -t ',' -k 4 | head -n 1 | 
cut -d, -f 4)
echo "$lowest16 - $lowest12" | bc



