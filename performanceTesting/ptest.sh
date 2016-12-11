#! /bin/bash

regexEmail="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b"
regexIP="^(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]){3}$"

while read regex
do
	echo "======================"
	echo "For regex $regex"
	echo "======================"
	echo "RIPGREP"
	time rg "$regex" sample.txt > /dev/null
	echo
	echo "GREP"
	time grep -e '$regex' sample.txt 
	echo
	echo "AWK"
	time awk '$regex' sample.txt > /dev/null  
done < regexPerformance.txt

echo
echo "===================="
echo "For emails"
echo "===================="
echo "RIPGREP"
time rg "$regexEmail" sampleEmail.txt > /dev/null
echo
echo "GREP"
time grep -e '$regexEmail' sampleEmail.txt
echo
echo "AWK"
time awk '$regexEmail' sampleEmail.txt > /dev/null

echo
echo "===================="
echo "For IPv4 addresses"
echo "===================="
echo "RIPGREP"
time rg "$regexIP" sampleIP.txt > /dev/null
echo
echo "GREP"
time grep -e '$regexIP' sampleIP.txt
echo
echo "AWK"
time awk '$regexIP' sampleIP.txt > /dev/null

