#!/bin/bash
wget http://inductions.delta.nitt.edu/algorithm.txt
wget http://inductions.delta.nitt.edu/dataStructure.txt

sudo rm -rf /home/prof1/Teaching_material/*
sudo rm -rf /home/prof1/Teaching_material/*

cat algorithm.txt | while read -r line
do 
	if echo "$line" |grep -q -e "\*\*"
	then 
		first=$(echo "$line" | sed "s/\*\*[[:space:]]//g")
		chapter=$(echo "$first" | sed "s/[[:space:]]//g")
		mkdir /home/prof1/Teaching_material/$chapter
		i=1
	fi
	if echo "$line" | grep -q -e "\-"
	then
		( echo "$line" | sed "s/\-[[:space:]]//g") >> /home/prof1/Teaching_material/$chapter/q$i.txt
		((i++))
	fi
done
cat dataStructure.txt | while read -r line
do 
	if echo "$line" |grep -q -e "\*\*"
	then 
		first=$(echo "$line" | sed "s/\*\*[[:space:]]//g")
		chapter=$(echo "$first" | sed "s/[[:space:]]//g")
		mkdir /home/prof2/Teaching_material/$chapter
		i=1
	fi
	if echo "$line" | grep -q -e "\-"
	then
		(echo "$line" | sed "s/\-[[:space:]]//g") >> /home/prof2/Teaching_material/$chapter/q$i.txt
		((i++))
	fi
done

