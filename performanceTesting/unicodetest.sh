#! /bin/bash


while read regexUni
do
	echo "======================="
	echo "For regex $regexUni"
	echo "======================="
	echo
	echo "RIPGREP"
	time rg '$regexUni' ../../../../Downloads/ja/ | wc -l 
	echo
	echo "GREP"
	time grep -Ear '$regexUni' ../../../../Downloads/ja/ | wc -l
done < regexUnicode.txt

: <<'END'
echo
echo "===================="
echo "For codepoints"
echo "===================="
echo "RIPGREP"
time rg '$regexCP' ../../../../Downloads/ja/1952/44789/4454850.xml
echo
echo "GREP"
time grep -E '$regexCP' ../../../../Downloads/ja/1952/44789/4454850.xml
END
