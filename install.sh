#! /bin/bash
echo "This will install pirate-radio in the /pirateradio folder."
echo "Press any key to continue. CTRL+C to exit."
read

echo "Updating apt ..."
apt-get -qq update 

echo "Installing dependancies ..."
apt-get install -y -qq python python-pip git ffmpeg 
pip install configparser

echo "Creating pirate-radio folder ..."
mkdir -p /pirateradio/
cp ./pirate-radio /etc/init.d/pirate-radio
cd /pirateradio

echo "Downloading pirate-radio ..."
git clone https://github.com/Make-Magazine/PirateRadio ./

echo "Setting default configuration ..."
sed -i 's@/root/pifm@/pirateradio/pifm@g' ./PirateRadio.py
sed -i "s@frequency.*@frequency = 88.2@g" ./pirateradio.conf
sed -i "s@music_dir.*@music_dir = /media/music@g" ./pirateradio.conf
sed -i "s@repeat_all.*@repeat_all = False@g" ./pirateradio.conf
chmod +x /etc/init.d/pirate-radio
update-rc.d pirate-radio remove
mkdir -p /var/run/pirate-radio/
chmod o+w /var/run/pirate-radio/

echo "Done."