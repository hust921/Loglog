#!/bin/bash

notRoot()
{
	if [ "$(id -u)" == "0" ]; then
		return 1;
	fi
	return 0;
}

chooseLogFile()
{
	DIALOG=${DIALOG=dialog}
	tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/readlog_menu$$
	trap "rm -f $tempfile" 0 1 2 5 15

	$DIALOG --clear --title "Readlog" \
		--menu "Choose a log file:" 21 80 5\
		"/var/log/messages" "Global system messages are logged here."\
		"/var/log/syslog" "Another global system log."\
		"/var/log/auth.log" "System Authorisation information."\
		"/var/log/kern.log" "Kernel messages are logged here"\
		"/var/log/dmesg" "Contains Kernel ring buffer messages" 2>$tempfile

	if [ $? -eq 1 ]; then
		clear;
		exit 1;
	fi
	menuChoice=`cat $tempfile`
}

exportHTML()
{
	$DIALOG --title "HTML export" --clear \
		--yesno "Export file to HTML?" 10 30

	if [ $? -eq 0 ]; then

		htmlDir=`$DIALOG --stdout --title "Where to save to" --fselect $HOME/ 14 48`

		if [ $? -eq 0 ]; then
			tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
			trap "rm -f $tempfile" 0 1 2 5 15

			$DIALOG --title "Name" --inputbox "File name:" 16 51 2> $tempfile

			htmlFile="$htmlDir`cat $tempfile`"
			cat $menuChoice | ccze -h >$htmlFile 
		fi
	fi
}

catOutput()
{
	$DIALOG --title "Print output" --clear \
		--yesno "Print output to terminal?" 10 30

	if [ $? -eq 0 ]; then
		cat $menuChoice | ccze -A |less -R
	fi
}

# Main function:
if notRoot $1; then
	echo "This script must be run as root"
	exit 1;
fi

chooseLogFile
exportHTML
catOutput

clear
