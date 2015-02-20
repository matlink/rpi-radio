#! /bin/bash
echo "BE CAREFUL, IT WILL WIPE THE /PIRATERADIO FOLDER. MAYBE YOU HAVE PUT SOME MUSICS IN THIS FOLDER. PRESS ANY KEY TO CONTINUE."
echo "CTRL+C IF YOU WANT TO EXIT."
read
echo "Uninstalling pirate-radio ..."
rm -rf /pirateradio 
rm -rf /var/run/pirate-radio 
rm -f /etc/init.d/pirate-radio
echo "Done."
echo "Those packages have been installed automatically : python python-pip git ffmpeg."
echo "Maybe you want to remove it if no other package uses it."
