vidarch-checker
=========


A simple script to check maniax's video lecture storage. http://va.ludost.net/index.php/Main_Page

The script is going to check the storage once a week and will email if there is new videos found

Install
==
Edit your copy of the script, then

	git clone https://github.com/dobber/vidarch-checker
	cd vidarch-checker
	cp -a vidarch-checker.sh /usr/local/bin/
	# edit /usr/local/bin/vidarch-checker.sh and change email address
	echo "59 23 * * 7 root /usr/local/bin/vidarch-checker.sh" >> /etc/crontab
