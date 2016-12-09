#! /bin/bash

while read regexUni
do
	echo "======================="
	echo "For regex $regexUni"
	echo "======================="
	echo
	echo "RIPGREP"
	time rg $regexUni sampleUnicode.txt > /dev/null
	echo
	echo "GREP"
	time grep -e '$regexUni' sampleUnicode.txt	
	echo
	echo "AWK"
	time awk '$regexUni' sampleUnicode.txt > /dev/null
done < regexUnicode.txt
