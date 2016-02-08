#!/bin/bash

# Prefixs & Constants
PREFIX="-->";

clear;

# Put in a visual gap
echo; echo;
echo "--------------------------------------------------------------------------";
echo "--------------------------------------------------------------------------";
echo "--------                LOCKING DOWN THE FIREWALL                 --------";
echo "--------------------------------------------------------------------------";
echo "--------------------------------------------------------------------------";
echo; echo;

# Lockdown the Firewall
#######################
ufw default deny outgoing
ufw default deny incoming
ufw allow out 53,67,68/tcp
ufw allow out 53,67,68/udp

echo; 
echo "$PREFIX Completed."; 
echo; 
echo; 
