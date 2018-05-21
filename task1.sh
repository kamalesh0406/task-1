#!/bin/bash

#Creating the hod's acoount

sudo groupadd students
sudo groupadd professors


sudo useradd -m -d /home/hod hod
echo "hod:hod" | sudo chpasswd 

sudo su hod -c "chmod -R 700 /home/hod"


for ((i=1;i<3;i++))
do
	sudo useradd -m -d /home/prof$i -g professors prof$i
	echo "prof$i:prof$i" | sudo chpasswd
	sudo su prof$i -c 'mkdir ~/Teaching_material'
	sudo su prof$i -c "chmod -R 700 /home/prof$i"
	sudo su prof$i -c "setfacl -m "u:hod:rwx" /home/prof$i"

done

for ((i=1;i<51;i++))
do 
	sudo useradd -m -d /home/student$i -g students student$i
	echo "student$i:student$i" | sudo chpasswd
	sudo su student$i -c 'mkdir ~/Homework'
	sudo su student$i -c 'mkdir ~/Homework/prof1_work'
	sudo su student$i -c 'mkdir ~/Homework/prof2_work'
	sudo su student$i -c "chmod -R 707 /home/student$i"
	sudo su student$i -c "setfacl -m "u:hod:rwx" /home/student$i"
done

for ((i=1;i<3;i++))
do 
	for((j=1;j<51;j++))
	do
		sudo su prof$i -c "< /dev/urandom tr -dc "[:alnum:]" | head -c100 > /home/prof$i/Teaching_material/q$j.txt"
	done
done

for ((i=1;i<3;i++))
do
	for((j=1;j<51;j++))
	do
		sudo su prof$i -c "shuf -zen5 /home/prof$i/Teaching_material/* | xargs -0 cp -t /home/student$j/Homework/prof"$i"_work"
	done
done









