#!/bin/bash

# Set Console Prefix Text
PREFIX="-->"; 
CONFIG="/boot/config.txt"; 
LOG="./tmp/install.log"; 


clear;



### Not silent install
if [ -z $1 ] ; then 
    tvservice -d edid >> "$LOG";
    
    # Write modes to Screenmodes File 
    edidparser edid | grep -m 30 -oP 'HDMI:.*\(([0-9][0-9])\).([0-9]*x[0-9]*)(p).*@.([0-9][0-9]) Hz.*([0-9][0-9]) MHz.* ([0-9]*)' >> "$LOG"; 
    
    
    # REGEX to Get Values Into 6 Variables
    # 'HDMI:.*\(([0-9][0-9])\).([0-9]*x[0-9]*)(p).*@.([0-9][0-9]) Hz.*([0-9][0-9]) MHz.* ([0-9]*)'
        
    
    # Offer Prefered List
    echo "$PREFIX Screen Modes Available:"; 
    echo;
    edidparser edid | grep -m 30 -oP 'HDMI:.*\(([0-9][0-9])\).1920x1080p.*@.([0-9][0-9]) Hz.*([0-9][0-9]) MHz.* ([0-9]*)';
    echo;
    
    
    echo "Enter screen mode ID, or 'c' to view the compatability list:";
    read screenmode;
    
    
    # Show requested compatability List (Resolutions above 1000px width)
    if [ "$screenmode" = "c" ] ; then 
	
        clear;
        
        echo "$PREFIX Full List / All Modes:"; 
        edidparser edid | grep -m 30 -oP 'HDMI:.*\(([0-9][0-9])\).1[0-9][0-9][0-9]x[0-9]*.*@.([0-9][0-9]) Hz.*([0-9][0-9]) MHz.* ([0-9]*)';
        echo; 
        
        echo "Enter screen mode ID, or 'c' to view the compatability list:";
        read screenmode;
    fi; 
    
	
	clear;
    
	
    # Check if a mode was entered
    if [ -z $screenmode ] ; then 
        
        # No: Error out.
        echo "$PREFIX ERROR. You didn't enter an option.";
        echo;
		/bin/bash ./detect_screen.sh;
        exit;
		
    else 
    
        # Confirm details
        echo; 
        echo "$PREFIX Are these details correct?";
        echo;
        echo " hdmi_mode: $screenmode"; 
        echo;
        echo "Press 'y' to save, or 'n' to start again...";
        read saveconfirm;
        
        
        # Chose to retry
        if [ -z $saveconfirm ] ; then 
          clear; 
          /bin/bash detect_screen.sh;
        fi;
        if [ "$saveconfirm" = "n" ] ; then 
          clear; 
          /bin/bash detect_screen.sh;
        fi;


        # Correct details confirmed - SAVE!
        if [ "$saveconfirm" = "y" ] ; then 
    
            # Print user selected mode to install log
            echo "USER SELECTED SCREEN MODE: $screenmode" >> "$LOG";
            
            # Entered a mode, enable mode in /boot/config.txt 
            echo "disable_overscan=0" >> "$CONFIG"; 
            echo "overscan_left=-15" >> "$CONFIG"; 
            echo "overscan_right=-15" >> "$CONFIG"; 
            echo "overscan_top=-15" >> "$CONFIG"; 
            echo "overscan_bottom=-15" >> "$CONFIG"; 
            echo "hdmi_group=1" >> "$CONFIG"; 
            echo "hdmi_mode=$screenmode" >> "$CONFIG";
            echo; echo; 
            
        fi;        
    fi; 
fi; 

# Confirm to user completion
clear;
