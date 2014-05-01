Loglog:
A bash, dialog based, linux log reader. Using czze for colorization.

Version 0.1 Beta state 
Can run without dependencies, but will not function.

Project description:
  This script is for educational purposes.
  It's a simple dialog listing relevant logs.
  You get the option to export a colorized version to HTML.
  Or read colorized output in a "less" session.
  
  <INSERT PICTURE HERE!>

Documentation:
  It's pretty strait forward to use.
  If you want to customize the logs listed, you can simply edit the list inside loglog.sh.
  Remember to changed the number "5" in the dialog arguments to a number curesponding to the number of lists.

  ....
  
  $DIALOG --clear --title "Readlog" \
	--menu "Choose a log file:" 21 80 5\ # <-- CHANGE 5 TO NUMBER OF LOGS LISTED.
	"/var/log/messages" "Global system messages are logged here."\ # <-- ADD/EDIT WHAT LOGS TO LIST/USE HERE.
  
  ....

Dependencies:
  dialog  (Testet on latest version avalible in the debian repos)
  ccze    (Testet on latest version avalible in the debian repos)
  less    (The linux terminal file reader)

Installation instructions:
  1.) First install dialog and ccze.
  
  Ubuntu/Debian based example:
    sudo apt-get install dialog ccze
    
  CentOS/Fedora/Red Hat based example:
    yum install ccze dialog -y
    
  Arch example:
    pacman -S dialog
    (Install ccze from AUR if not in offical repo)
    
  2.) Simple download and run loglog.sh

Author Morten Lund <92morten@gmail.com>

Disclaimer:
See LICENSE.txt
