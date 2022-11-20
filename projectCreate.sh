#!/bin/bash
function gadoc() {
echo "What type? (lab/class/homework)"
read type
echo "Express? (t/f)"
read express
echo "MVC? (t/f)"
read MVC 

if [[ "$type" == "lab" ]] ;
then
	echo "Lab name?"
	read labName
	cd ~/OneDrive/Desktop/WebDevProject/"General Assembly"/Labs
	mkdir $labName
	cd ./$labName
	if [[ "$MVC" == "f" ]] ;
	then
		createBasic
	elif [[ "$MVC" == "t" ]] ;
	then
		createEJS
	fi
	if [[ "$express" == "t" ]] ;
	then
		createExpress
		echo "File : $labName >> succesfully created"
	else
		echo "File : $labName >> succesfully created"	
	fi
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
	if [[ "$MVC" == "f" ]] ;
	then
		createBasic
	elif [[ "$MVC" == "t" ]] ;
	then
		createEJS
	fi
	if [[ "$express" == "t" ]] ;
	then
		createExpress
		echo "File : $newFolder >> succesfully created"
	else
		echo "File : $newFolder >> succesfully created"
	fi

elif [[ "$type" == "homework" ]] ;
then
  	echo "Homework name?"
        read homeworkName
        cd ~/OneDrive/Desktop/WebDevProject/"General Assembly"/HW
        mkdir $homeworkName
        cd ./$homeworkName
	if [[ "$MVC" == "f" ]] ;
	then
		createBasic
	elif [[ "$MVC" == "t" ]] ;
	then
		createEJS
	fi
	if [[ "$express" == "t" ]] ;
	then
		createExpress
		echo "File : $homeworkName >> succesfully created"
	else
		echo "File : $homeworkName >> succesfully created"
	fi

else
	echo "File >> failed to be made"
fi
}

function gainstall() {
	cd ~
	touch .bash_profile
	echo "source ~/projectCreate.sh" >> .bash_profile
}

function createBasic() {
		mkdir js
		mkdir css
		touch index.html
		printf "<!DOCTYPE html>\n<html lang='en'>\n\t<head>\n\t\t<meta charset='UTF-8' />\n\t\t<meta http-equiv='X-UA-Compatible' content='IE=edge' />\n\t\t<meta name='viewport' content='width=device-width, initial-scale=1.0' />\n\t\t<link rel='stylesheet' href='css/style.css'>\n\t\t<script src='./js/script.js'></script>\n\t\t<title>Document</title>\n\t</head>\n\t<body>\n\t</body>\n</html>" >> index.html
		touch ./js/script.js
		touch ./css/style.css
}

function createEJS() {
		mkdir models
		touch ./models/models.js
		mkdir views
		npm install ejs
		wait
		echo "ejs installed <<"
		touch ./views/show.ejs
		printf "<!DOCTYPE html>\n<html lang='en'>\n\t<head>\n\t\t<meta charset='UTF-8' />\n\t\t<meta http-equiv='X-UA-Compatible' content='IE=edge' />\n\t\t<meta name='viewport' content='width=device-width, initial-scale=1.0' />\n\t\t<link rel='stylesheet' href='css/style.css'>\n\t\t<script src='./js/script.js'></script>\n\t\t<title>Document</title>\n\t</head>\n\t<body>\n\t</body>\n</html>" >> ./views/show.ejs
		mkdir controllers
		touch ./controllers/controllers.js
}

function createExpress() {
		echo "Port number?"
		read port
		touch server.js
		wait
		echo "server.js created <<"
		npm init -y
		wait
		echo "npm initialized <<"
		npm install express
		wait
		echo "express installed <<"
		npm install dotenv
		wait
		echo "dotenv installed <<"
		touch .env
		echo "PORT=$port" >> .env
		touch .gitignore
		printf ".env\nnode_modules" >> .gitignore
		printf "const { response } = require('express');\nconst express = require('express');\nrequire('dotenv').config();\n\nconst app = express();\nconst port = process.env.PORT || 3000;\n\n\napp.listen(port, () => {\n\tconsole.log(\`listening to port \${port}\`);\n});" >> server.js
}
