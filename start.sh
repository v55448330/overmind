#!/bin/sh
vagrant version
if [ "$?" -eq 0 ]; then
	vagrant up
	until [ "$?" -eq 0 ]
	do
		echo "Run vagrant up is failed. Retry..."
		vagrant up
	done

	cd overmind
	which npm
	if [ "$?" -eq 0 ]; then
		npm install gulp bower -g

		if [ "$?" -eq 0 ]; then
			npm install && bower install
			if [ "$?" -eq 0 ]; then
				gulp build && node overmind.js
			else
				echo "Launch overmind UI failed."
				exit 4
			fi

		else
			echo "Install gulp and bower failed."
			exit 3
		fi

	else
		echo "Please check nodejs installation."
		exit 2
	fi

else
	echo "Please check vagrant installation."
	exit 1
fi
