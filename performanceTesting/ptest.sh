#! /bin/bash

regexEmail="^[_]*([a-z0-9]+(\.|_*)?)+@([a-z][a-z0-9-]+(\.|-*\.))+[a-z]{2,6}$"
regexIP="^((([2][5][0-5]|([2][0-4]|[1][0-9]|[0-9])?[0-9])[.]){3})([2][5][0-5]|([2][0-4]|[1][0-9]|[0-9])?[0-9])$"

while read regex
do
	echo "======================"
	echo "For regex $regex"
	echo "======================"
	echo "RIPGREP"
	time rg "$regex" sample.txt > /dev/null
	echo
	echo "GREP"
	time grep -e "$regex" sample.txt 
	echo
	echo "AWK"
	time awk '$regex' sample.txt > /dev/null  
done < regexPerformance.txt

echo
echo "===================="
echo "For emails"
echo "===================="
echo "RIPGREP"
time rg "$regexEmail" sampleEmail.txt
echo
echo "GREP"
time grep -e $regexEmail sampleEmail.txt
echo
echo "AWK"
time awk '$regexEmail' sampleEmail.txt

echo
echo "===================="
echo "For IPv4 addresses"
echo "===================="
echo "RIPGREP"
time rg "$regexIP" sampleIP.txt > /dev/null
echo
echo "GREP"
time grep -e $regexIP sampleIP.txt
echo
echo "AWK"
time awk '$regexIP' sampleIP.txt > /dev/null

