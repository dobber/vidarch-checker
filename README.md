vidarch-checker
=========

A simple script to check maniax's video lecture storage

Install
==
Edit your copy of the script, then

	git clone https://github.com/dobber/vidarch-checker
	cd vidarch-checker
	cp -a vidarch-checker.sh /usr/local/bin/
	echo "59 23 * * 7 root /usr/local/bin/vidarch-checker.sh" >> /etc/crontab
