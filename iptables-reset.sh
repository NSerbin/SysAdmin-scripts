#!/bin/sh

## FLUSH ALL RULES ##

iptables -P FORWARD	ACCEPT
iptables -P OUTPUT	ACCEPT
iptables -P INPUT	ACCEPT


for table in $(</proc/net/ip_tables_names)
do 
	iptables -t $table -F
	iptables -t $table -X
	iptables -t $table -Z 
done


## ECHO ##
echo ""
echo ""
echo "				       ##################"
echo "				       ## FILTER RULES ##"
echo " 				       ##################"
sudo iptables -nvL -t filter


echo ""
echo ""
echo " 					###############"
echo "					## NAT RULES ##"
echo " 					###############"
sudo iptables -nvL -t nat



echo ""
echo ""
echo "Script Done !"
echo ""
echo ""
echo "Run as root if want permanent"
echo "iptables-save > /etc/iptables/iptables.rules"


### EOF ###
