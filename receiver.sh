#! /bin/bash
sudo ifconfig wlan1 192.168.6.6 netmask 255.255.255.0		# the ip address of hmb pro

ip addr | grep 192.168.6.6

while [ 1 ]
do	
	time_stp="sample-"`date "+%Y-%m-%d-%H-%M-%S"`".dat"
	/usr/bin/expect collect.exp $time_stp
	echo "collect done, time:" `date`
done


	
	
