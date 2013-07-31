#!/bin/bash

workdir="/var/lib/vidarch-checker/"
LAST="$workdir/last"
CURR="$workdir/curr"
DIFF="$workdir/diff"

from="From: root@${HOSTNAME}"
email="zlobber@gmail.com"
subject="New videos in maniax's lecture archive"

template="Here is a list of all the new videos in maniax's video archive. Enjoy your free time!"

if [ ! -d $workdir ] ; then
	mkdir -p $workdir
fi

rsync --dry-run -a rsync://va.ludost.net/va/ | awk '{ print substr($0, index($0,$5)) }' > $CURR

if [ ! -f $LAST ] ; then
	echo "This is the first run, no report for now"
	mv $CURR $LAST
	exit 0
fi

diff $CURR $LAST | grep \< | sed -e s/^\<' '//g | grep '.avi\|.mp4\|.rm' > $DIFF

#mv $CURR $LAST

if [ -s $DIFF ] ; then
	mail="<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">
<html><head><title></title></head><body><p>
${template}<br>
"

	while read line; do
		mail="${mail}
<a href=\"http://va.ludost.net/files/${line}\">${line}</a><br>"
	done < $DIFF

	mail="$mail</p></body></html>"
	echo "${mail}" | mail -a $from -a "MIME-Version: 1.0" -a "Content-Type: text/html" -s "${subject}" "${email}"
fi
