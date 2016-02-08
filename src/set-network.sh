#!/bin/bash

# Const Paths
PREFIX="-->";
INTERFACES='/etc/network/interfaces';
NEW_SETTINGS='./artifacts/interfaces.txt';

# Make a backup of the interfaces file
cp "$INTERFACES" ./backups/;


# Put in a visual gap
clear; 


### Request Wireless SSID input
if [ -z $1 ] ; then 
    echo "$PREFIX Enter SSID for Wireless network, then press [ENTER]:";
    read ssid;
	clear;
else 
    echo "wpa-ssid \"$1\"" >> "$INTERFACES";
    clear;    
fi;

### Request Wireless PSK-KEY input
if [ -z $2 ] ; then 
    echo "$PREFIX Enter PASS for Wireless network, then press [ENTER]:";
    read passkey;
	clear;
else 
    echo "wpa-psk \"$2\"" >> "$INTERFACES";
	clear; 
fi;

# Confirm to user completion
clear;




# Confirm details
echo "$PREFIX Are these details correct?";
echo;
echo " SSID: $ssid"; 
echo " PASS: $passkey"; 
echo;
echo "Press 'y' to save, or 'n' to start again...";
read saveconfirm;
clear;


# Chose to retry
if [ -z $saveconfirm ] ; then 
  /bin/bash network.sh;
fi;
if [ "$saveconfirm" = "n" ] ; then 
  /bin/bash network.sh;
fi;

# Correct details confirmed - SAVE!
if [ "$saveconfirm" = "y" ] ; then 
    cat "$NEW_SETTINGS" > "$INTERFACES";
    echo "wpa-ssid \"$ssid\"" >> "$INTERFACES";
    echo "wpa-psk \"$passkey\"" >> "$INTERFACES";
fi;



# Reboot?

### If provided on CLI 'y' in ARGS then reboot
if [ "$3" = "y" ] ; then 
    echo "Rebooting..."; echo;
    reboot now;
fi;


### Not provided in CLI so ask user
if [ -z $3 ] ; then
    
    # Not provided in ARGS, Request action from user
    echo "$PREFIX Reboot to enable changes?  Key 'y' the press [ENTER] to reboot.";
    read actionkey;
    
    # If empty then exit script
    if [ -z $actionkey ] ; then 
        clear; 
        exit; 
    fi; 
    
    # If 'y' then reboot
    if [ "$actionkey" = "y" ] ; then 
        clear; 
        reboot now;
    fi; 
fi; 
