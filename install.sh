#! /bin/bash
mkdir -p /pirateradio/
apt-get update -qq
apt-get install -y -qq python python-pip git ffmpeg 
pip install configparser
cp ./pirate-radio /etc/init.d/pirate-radio
cd /pirateradio
git clone https://github.com/Make-Magazine/PirateRadio ./
sed -i 's@/root/pifm@/pirateradio/pifm@g' ./PirateRadio.py
sed -i "s@frequency.*@frequency = 88.2@g" ./pirateradio.conf
sed -i "s@music_dir.*@music_dir = /media/music@g" ./pirateradio.conf
chmod +x /etc/init.d/pirate-radio
update-rc.d pirate-radio remove
