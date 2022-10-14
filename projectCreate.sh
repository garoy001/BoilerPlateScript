#!/bin/bash
function gadoc() {
echo "What type? (lab/class/homework)"
read type

if [[ "$type" == "lab" ]] ;
then
	echo "Lab name?"
	read labName
	cd ~/OneDrive/Desktop/WebDevProject/"General Assembly"/Labs
	mkdir $labName
	cd ./$labName
	mkdir js
	mkdir css
	cp ~/index.html ~/OneDrive/Desktop/WebDevProject/"General Assembly"/Labs/$labName
	touch ./js/script.js
	touch ./css/style.css
	echo "File : $labName >> succesfully created"
elif [[ "$type" == "class" ]] ;
then 
	echo "Please enter week"
	read week
	echo "Please enter day"
	read day
	newFolder="Week $week day $day"
	cd ~/OneDrive/Desktop/WebDevProject/"General Assembly"/"Class Folders"
	mkdir "$newFolder"
	cd ./"$newFolder"
        mkdir js
        mkdir css
        cp ~/index.html ~/OneDrive/Desktop/WebDevProject/"General Assembly"/"Class Folders"/"$newFolder"
        touch ./js/script.js
        touch ./css/style.css
	echo "File : $newFolder >> succesfully created"
elif [[ "$type" == "homework" ]] ;
then
  	echo "Homework name?"
        read homeworkName
        cd ~/OneDrive/Desktop/WebDevProject/"General Assembly"/HW
        mkdir $homeworkName
        cd ./$homeworkName
        mkdir js
        mkdir css
        cp ~/index.html ~/OneDrive/Desktop/WebDevProject/"General Assembly"/"Class Folders"/$homeworkName
        touch ./js/script.js
        touch ./css/style.css
	echo "File : $homeworkName >> succesfully created"
else
	echo "File >> failed to be made"
fi
}
